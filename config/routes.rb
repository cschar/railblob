Rails.application.routes.draw do
  resources :microposts
  resources :users
  get 'welcome/index'
  root 'application#hello'


  get 'welcome/show'

  # root 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
