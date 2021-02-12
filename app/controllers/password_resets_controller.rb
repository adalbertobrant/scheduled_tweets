class PasswordResetsController < ApplicationController
    def new
    end

    def create
      @user = User.find_by(email: params[:email])
      if @user.present?
        #send email
        #send email later
        #PasswordMailer.with(user: @user).reset.deliver_later   
        #sendo email now -this one is not very good for speed, takes too long     
        PasswordMailer.with(user: @user).reset.deliver_now

          
      end
      redirect_to root_path, notice: "If an account with that email was found, link was sent to reset your password!"
    end
end