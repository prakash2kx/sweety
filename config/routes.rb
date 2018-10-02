Rails.application.routes.draw do
  root to: 'login#sign_in', as: 'logging_in'
  get 'loggedin', to: 'login#logged_in'
  get 'logout', to: 'login#logout'
  resources :metrics

  resources :reports do
    collection do
      get :daily_report
      get :month_to_date_report
      get :monthly_report
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
