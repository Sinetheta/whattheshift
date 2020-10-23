class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_after_action :verify_authorized

  def github
    user = User.from_omniauth(request.env['omniauth.auth'])
    user.link_account_from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect user, event: :authentication #this will throw if user is not activated
    set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
  end

  def failure
    redirect_to root_path
  end
end
