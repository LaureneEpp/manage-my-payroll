Rails.application.routes.draw do
  get 'teams/index'
  get 'teams/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#dashboard' # shortcut for the abov
  resources :employees
  resources :departements, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end
end
