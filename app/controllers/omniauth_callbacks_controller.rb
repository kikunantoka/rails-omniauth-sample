class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  def line
    callback_from :line
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @customer_user = CustomerUser.find_for_oauth(request.env['omniauth.auth'])

    if @customer_user.persisted?
      sign_in_and_redirect @customer_user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end
