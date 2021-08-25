Rails.application.routes.draw do
  get 'contacts/index'
  devise_for :users
  get 'home/index'
  root 'home#index'

  resources :contacts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
