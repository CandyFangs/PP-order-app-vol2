Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :products do
    resources :elements
  end
  resources :materials do
    resources :colors
  end
  root 'home#start'
  get '/thanks' => 'home#thanks', as: 'thanks'
  resources :orders do
    resources :order_items
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
