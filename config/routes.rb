Rails.application.routes.draw do
  root 'welcome#index'

  resources :comparisons
  resources :projects do
    resources :scenarios do
      member do
        post 'run'
      end
    end
  end
  resources :project_tokens, only: [:create]
  resources :revisions

  namespace :api do
    resources :revisions
    resources :images
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }
end
