Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    resources :revisions
  end
end
