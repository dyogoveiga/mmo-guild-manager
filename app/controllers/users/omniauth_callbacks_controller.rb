# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :require_discord_user!

  def discord
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Discord")
    else
      session["devise.discord_data"] = request.env["omniauth.auth"]
      redirect_to dashboard_path
    end
  end
end
