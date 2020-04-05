Rails.application.routes.draw do

  namespace :dashboards do
    get 'states(/:id)', to: 'states#show', as: :states
  end

  get 'dashboards', to: 'dashboards#index'

  mount Sidekiq::Web => '/sidekiq' 

  root 'dashboards#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
