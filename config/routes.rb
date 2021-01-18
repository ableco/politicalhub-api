require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :political_organizations, only: %i(index show)
  get "/candidates", to: "candidates#index"
end
