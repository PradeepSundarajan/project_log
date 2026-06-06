Rails.application.routes.draw do
  devise_for :users

  # Admin API — full CRUD, email + password auth via Devise session
  namespace :admin do
    namespace :api do
      namespace :v1 do
        resources :vehicles do
          member { patch :update_status }
        end
        resources :drivers
        resources :parties
        resources :work_tables do
          member do
            post :start_work
            post :end_work
            post :add_diesel
          end
        end
        resources :diesel_transactions do
          collection { get :report }
        end
        resources :users
      end
    end
  end

  # Worker API — scoped to current driver, mobile_no + password auth
  namespace :worker do
    namespace :api do
      namespace :v1 do
        post   "login",  to: "sessions#create"
        delete "logout", to: "sessions#destroy"

        resources :work_tables, only: [:index, :show] do
          member do
            post :start_work
            post :end_work
          end
        end

        resources :diesel_transactions, only: [:index]
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
