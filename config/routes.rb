Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do

      resources :users do
        collection do
          post :login
          get  :feed
        end
      end

      resources :languages do
        member do
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
          post :watch
          post :unwatch
        end
        collection do
          get :watched_movies
        end
        resources :watch_list, only: [] do
          post 'add', on: :collection
          post 'remove', on: :collection
        end
      end

      resources :reviews do
        member do
          patch :like
          patch :unlike
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
