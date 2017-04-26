class CustomerUser < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:twitter, :line]

  def self.find_for_oauth(auth)
    customer_user = CustomerUser.find_by(uid: auth.uid, provider: auth.provider)

    unless customer_user
      customer_user = CustomerUser.create(
        uid:      auth.uid,
        provider: auth.provider,
      )
    end

    customer_user
  end
end
