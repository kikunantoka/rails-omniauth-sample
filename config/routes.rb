Rails.application.routes.draw do
  devise_for :customer_users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/customer_users' => 'customer_users#show', as: "customer_user_root"
end
