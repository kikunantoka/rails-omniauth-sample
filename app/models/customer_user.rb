class CustomerUser < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:twitter, :line]
end
