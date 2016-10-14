class OrdersConfirmation < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def confirmation_email(user, order)
    @user = user
    @order = order
    mail(
      # to: 'smtp://127.0.0.1:5001',
      # to: 'jenyee1022@gmail.com',
      to: user.email,
      subject: "Confirmation: Order number #{order.id}"
    )
  end

end
