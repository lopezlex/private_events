Rails.application.routes.draw do
  get '/user/:id', to: 'users#profile', as: :user
  resources :users, only: :index
  root to: 'events#index'

  get "events/filter/:filter" => "events#index", as: :filtered_events

  devise_for :users

  resources :events do
    resources :registrations
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
