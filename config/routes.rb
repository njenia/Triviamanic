Triviamanic::Application.routes.draw do

  # devise_for :users, :controllers => { :registrations => "Registrations", :sessions => "devise/sessions" } do
  #  resources :quizzes
  #end

  devise_for :users do
    resources :quizzes
  end

  get '/users', to: 'users#index'

  resources :quizzes do
    resources :categories
    resources :games
  end

  resources :categories do
    resources :questions
    member do
      put 'reorder'
    end
  end

  resources :games do
    resources :game_player_groups
  end

  resources :game_player_groups do
    resources :player_group_users, :only => [:create]
  end

  delete '/game_player_groups/:game_player_group_id/users/:user_id',
    :to => 'player_group_users#destroy'

  #resources :sessions, only: [:new, :create, :destroy]

  get '/games/:game_id/start', to: 'games#start'
  get '/games/:game_id/game_board', to: 'games#board'

  resources :question_images

  root :to => 'static_pages#main'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

