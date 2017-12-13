Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :destinations do
        resources :reviews
      end
      post 'authenticate', to: 'authentication#authenticate'
    end
  end


end
