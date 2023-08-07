Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/bachelorettes/:id", to: "bachelorettes#show"
  get "/bachelorettes/:bachelorette_id/contestants", to: "contestants#index"
  get "/contestants/:id", to: "contestants#show"

  get "/outings/:id", to: "outings#show"
  delete "/outings/:outing_id/contestants/:id", to: "contestant_outings#destroy"
end
