Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#dashboard' # shortcut for the abov
  resources :employees
  resources :departements, only: [:index, :show] do
    resources :teams, only: [:index, :show]
  end
  
  resources :allowances
  resources :payslip_allowances, only: [:destroy]
  resources :deductions
  resources :payslip_deductions, only: [:destroy]
  resources :payslips
end 
