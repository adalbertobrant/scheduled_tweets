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

    def edit
      @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to password_reset_path, alert:"Your token has expired. Please try again."
    end

    def update
      @user = User.find_signed!(params[:token], purpose: "password_reset")
      if @user.update(password_params)
        redirect_to sign_in_path, notice:"Password reset successfully. Please sign in."
      else
        render :edit
      end
    end

    private
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end