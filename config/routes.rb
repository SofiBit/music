Rails.application.routes.draw do
  resources :links, only: %i[index]

  post "/link_source", to: "links#link_source"
end
