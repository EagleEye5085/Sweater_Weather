Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/book-search", to: 'book#search'
      get "/forecast", to: 'forecast#location_weather'
    end
  end
end
