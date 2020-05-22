Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  resources :users, only: %i(show)

  resources :logs do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end

  resources :dones, only: %i(index)
  resources :knowledges, only: %i(index)
  resources :todos, only: %i(index)

  authenticated :user do
    root to: 'logs#index'
  end

  root to: 'landings#home'


  # 例外 動的404
  get '*not_found', to: 'application#routing_error'
  post '*not_found', to: 'application#routing_error'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
