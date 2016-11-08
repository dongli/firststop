Rails.application.routes.draw do
  root 'static_contents#home'
  devise_for :users
  mount Carload::Engine => '/carload'
  resources :users
end
