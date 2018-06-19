Rails.application.routes.draw do
  root 'welcome#index'

  resources :comparisons
  resources :revisions

  namespace :api do
    resources :revisions
    resources :images
  end

  devise_for :users
end
