Rails.application.routes.draw do

  root "dashboard_pages#home"

  get '/signup',    to: "users#new"

  get '/login',     to: "sessions#new"
  post '/login',    to: "sessions#create"
  delete 'logout',  to: "sessions#destroy"

  resources :users,         except: :new
  resources :categories,    except: [:new, :create, :edit, :update, :destroy]

  namespace :admin do
    resources :categories
    resources :dashboard, only: :index
  end

end
