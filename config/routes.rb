Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  post 'home/add_stock'
  resources :stock, param: :id
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
