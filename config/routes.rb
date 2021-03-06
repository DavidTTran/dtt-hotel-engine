Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :dnd do
        resources :classes, only: [:index]
        resources :monsters, only: [:index]
        resources :parties
        resources :characters
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
