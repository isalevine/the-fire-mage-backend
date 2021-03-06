Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        # :index added to game_sessions for debugging on Heroku
        resources :game_sessions, only: [:index, :show, :create, :update, :destroy] do

          resources :terrains, only: [:index, :create, :destroy]
          resources :all_terrains, only: [:index, :create, :destroy]

          resources :cells, only: [:index, :show, :create, :update, :destroy] do
            resources :inventories, only: [:index, :show, :create, :update, :destroy]
          end

        end

      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
