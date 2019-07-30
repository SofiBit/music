Rails.application.routes.draw do
  resources :links, only: %i[index show]
end
