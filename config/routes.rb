Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: "reurls#index"
  get '/:token', to: "reurls#redirect"
  post '/newurl', to: "reurls#newurl"
  get '*', to: "reurls#index"
end
