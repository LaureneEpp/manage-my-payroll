Rails.application.routes.draw do
  root 'pages#dashboard' # shortcut for the abov
  resources :employees
  resources :departements, only: [:index, :show] do
    resources :teams, only: [:show]
  end
  
  resources :allowances
  resources :payslip_allowances, only: [:destroy]
  resources :deductions
  resources :payslip_deductions, only: [:destroy]
  resources :payslips do
    member do
      post 'increase_present_days'
      post 'decrease_present_days'
      post 'increase_absent_days'
      post 'decrease_absent_days'
    end
  end
  resources :teams, only: [:index, :new, :create]
end 
