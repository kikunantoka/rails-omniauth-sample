class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  def line
    callback_from :line
  end

  private

  def callback_from(provider)
    @customer_user = CustomerUser.find_for_oauth(request.env['omniauth.auth'])

    if @customer_user.persisted?
      if provider == :twitter
        auth = request.env['omniauth.auth']
        session[:user_id] = auth['uid']
        session[:name] = auth['info']['name']
        session[:oauth_token] = auth['credentials']['token']
        session[:oauth_token_secret] = auth['credentials']['secret']
      end
      sign_in_and_redirect @customer_user, event: :authentication
    else
      session["devise.#{provider.to_s}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
