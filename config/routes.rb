Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/forecast", to: "forecasts#show"
      post "/users", to: "users#create"
      post "/sessions", to: "sessions#create"
      post "/road-trip", to: "roadtrip#create"
      get "/book-search", to: "books#search"
    end
  end
end
