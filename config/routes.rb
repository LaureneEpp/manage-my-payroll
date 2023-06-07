Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#dashboard' # shortcut for the abov
  resources :employees
  resources :departements, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end
  
  resources :payslips do
    resources :allowances, only: [:index, :show]
    resources :deductions, only: [:index, :show]
  end
end
