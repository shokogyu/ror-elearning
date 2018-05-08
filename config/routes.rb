Rails.application.routes.draw do

  root to: "dashboard_pages#home"

  resources :users

end
