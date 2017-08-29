Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :microposts,          only: [:create, :destroy]

  resources :users do
    # collection do
    #   get :bnames  e.g /users/bnames --> could return all users with 'b' in name
    # end
    #GET	/users/1/following	following	following_user_path(1)
    member do
      get :following, :followers  # /user/1/following
    end
  end

  resources :relationships,       only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
