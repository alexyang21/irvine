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
      mandrill = Mandrill::API.new ENV["MANDRILL_APIKEY"]
      template_name = "FILL_IN_HERE"
      template_content = [
        {
          name:             "header",
          content:          "
                            <h1>Content</h1>
                            "
        },
        {
          name:             "main",
          content:          "
                            <h1>Content</h1>
                            "
        }
      ]
      message = {
        subject:            "SUBJECT",
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