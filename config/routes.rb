Rails.application.routes.draw do
  resources :comments
  get 'about' => 'pages#about'

  get 'contact' => 'pages#contact'

  get 'resources' => 'pages#resources'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'

  get 'categories/edit'

  get 'categories/new'

  get 'categories/show'

  root 'home#index'
  resources :posts
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
