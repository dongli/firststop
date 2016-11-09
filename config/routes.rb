Rails.application.routes.draw do
  root 'static_contents#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  mount Carload::Engine => '/carload'
  resources :users
  resources :guides
end
