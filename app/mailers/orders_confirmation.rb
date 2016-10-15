class OrdersConfirmation < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(user, order)
    @user = user
    @order = order
    mail(
      to: user.email,
      subject: "Confirmation: Order number #{order.id}"
    )
  end

end
