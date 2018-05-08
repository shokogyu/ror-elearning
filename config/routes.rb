Rails.application.routes.draw do

  root to: "dashboard_pages#home"

  get '/signup',		to: "users#new"

  resources :users,		except: :new

end
