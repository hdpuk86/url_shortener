# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users

  resources :url_connectors, only: [:index, :create, :destroy]
  get '/:short_url_ref', to: 'url_connectors#connector'

  root to: 'url_connectors#index'
end
