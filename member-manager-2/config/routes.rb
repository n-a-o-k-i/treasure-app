Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # : <snip>
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :members, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
  resources :get_github_data, only: [:index]

  root to: 'home#index'
end
