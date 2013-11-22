class UserMailer < ActionMailer::Base
  require 'mandrill'

  # def email_receipt(user, order)
  #   @user = user
  #   @order = order
  #   email_with_name = "#{@order.name} <#{@order.email}>"
  #   mail(to: email_with_name, subject: "Hello from FlipOrder!")
  # end

  def email_receipt(user, order)
    begin

      # Create dynamic content string to pass to Mandrill
      content_main = "
        <p>Delivery to:</p>
        <p>
          #{order.name}<br>
          #{order.address}, #{order.city}, #{order.state}<br>
          Thu, 11/16 @ 6:00pm
        </p>
        <br>
      "

      content_menu = ""
      order.items.each do |item|
        content_menu << "
            <tr>
              <td>#{item.menu.name}</td>
              <td>#{item.quantity}</td>
              <td>#{helpers.number_to_currency(item.menu.price)}</td>
            </tr>
        "
      end
      content_charge = "

          <tr>
            <td>Tax</td>
            <td></td>
            <td>#{helpers.number_to_currency(order.total_price * 0.08)}</td>
          </tr>
          <tr>
            <td>Tip</td>
            <td></td>
            <td>$5.00</td>
          </tr>
          <tr>
            <td>Delivery</td>
            <td></td>
            <td>$6.00</td>
          </tr>
      "

        content_total = "
          <tr>
            <td>Total</td>
            <td></td>
            <td>#{helpers.number_to_currency(order.total_price * 1.08 + 6.00)}</td>
          </tr>
      "

      # Set variables for Mandrill API
      mandrill = Mandrill::API.new ENV["MANDRILL_APIKEY"]
      template_name = "customer-order-receipt"
      template_content = [
        {
          name:     "main",
          content:  content_main
        },
        {
          name:     "menu",
          content:  content_menu
        },
        {
          name:     "charge",
          content:  content_charge
        },
        {
          name:     "total",
          content:  content_total
        }
      ]
      message = {
        to: [{
          email:            "#{order.email}",
          name:             "#{order.name}"
        }]
      }
      result = mandrill.messages.send_template template_name, template_content, message

    rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'
      raise
    end
  end

  def email_alert(order)
    begin
      mandrill = Mandrill::API.new ENV["MANDRILL_APIKEY"]
      template_name = "alex-order-notification"
      template_content = [
        {
          name:             "main",
          content:          "
                            Restaurant: #{order.items.first.menu.restaurant.name}<br>
                            <br>
                            Customer name: #{order.name}<br>
                            Customer email: #{order.email}<br>
                            Customer phone: #{order.phone}<br>
                            Customer address:<br>
                            #{order.address}<br>
                            #{order.city}, #{order.state}
                            "
        }
      ]
      message = {
        subject:            "New order placed for #{helpers.number_to_currency(order.total_price)}",
        to: [{
          email:            "alexyang.personal@gmail.com",
          name:             "Alex Yang"
        }]
      }
      result = mandrill.messages.send_template template_name, template_content, message

    rescue Mandrill::Error => e
      # Mandrill errors are thrown as exceptions
      puts "A mandrill error occurred: #{e.class} - #{e.message}"
      # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'
      raise
    end
  end

  def helpers
    ActionController::Base.helpers
  end
end