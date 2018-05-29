Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    resources :revisions
    resources :images
  end
end
