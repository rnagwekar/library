Rails.application.routes.draw do
  # get 'sessions/new'
  # post 'sessions/create'
  # delete 'sessions/destroy'

  root :to => 'sessions#new'

	#resources :sessions
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  #get   '/books/assign/id',   to: 'books#assign'

  resources :people

  resources :books do
    member do
      get 'assign'
      get 'release'
    end
  end

  resources :devices do
    member do
      get 'showdevices'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
