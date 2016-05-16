Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do

      resources :users do
        collection do
          post :login
        end
      end

      resources :languages do
        collection do
          get :discover
          get :top_movies
          get :new_movies
          get :top_users
        end
      end

      resources :movies do
        member do
          post :follow
          post :unfollow
        end
      end

      resources :reviews do
        member do
          post :like
          post :unlike
        end
      end

      resources :comments

      resources :search do
        collection do
          get :movies
          get :users
        end
      end
    end
  end

end
