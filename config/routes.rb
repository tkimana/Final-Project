Rails.application.routes.draw do
  # localhost:3000/api/v1/login
  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index,:create,  :update, :destroy]
      resources :users, only: [:create, :index]
      resources :lists, only: [:index, :create, :update, :destroy]
      post '/login', to: 'auth#create'
      get '/userlists', to: 'lists#get_user_list'



      get '*path', to: "application#react_app", constraints: ->(request) do
  !request.xhr? && request.format.html?
  end
     
    end
  end
 
 
end



