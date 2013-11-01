class UserMailer < ActionMailer::Base
  default from: "alex@fliporder.com"

  def email_receipt(user, order)
    @user = user
    @order = order
    email_with_name = "#{@order.name} <#{@order.email}>"
    mail(to: email_with_name, subject: "Hello from FlipOrder!")
  end

  def email_alert(order)
    @order = order
    mail( to: "alexyang.personal@gmail.com",
          subject: "#{helpers.number_to_currency(@order.total_price)} FlipOrder for #{@order.items.first.menu.restaurant.name}")
  end

  def helpers
    ActionController::Base.helpers
  end
end