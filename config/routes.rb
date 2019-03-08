Rails.application.routes.draw do
  resources :boards
  devise_for :users
end
