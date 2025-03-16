Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/milks" => "milks#index"
  post "/milks" => "milks#create"
  get "/milks/:id" => "milks#show"
  patch "/milks/:id" => "milks#update"
  delete "/milks/:id" => "milks#destroy"
end
