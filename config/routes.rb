Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do

      get 'login', to: 'authentication#facebook'

      resources :users do
        collection do
          get :hello
        end


      end
    end
  end

end
