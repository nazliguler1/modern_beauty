Rails.application.routes.draw do
  
  resources :services, :reservations
  


  match '/auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match 'auth/failure', :to => 'sessions#failure', :via => [:get, :post]
  match 'sessions/destroy', :as => 'logout', :via => [:get, :post]
  get 'sessions/start_test'
  get 'sessions/clear'
  get 'session/debug'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [:destroy]# do
    resources :profiles, only: [:show, :edit, :update, :destroy]
#  end

  # You can have the root of your site routed with "root"
  root 'welcome#landing'
  
  get 'welcome/landing', :as => :welcome_landing
 # get 'reservation/index', :as => :reservation_index
 # get 'service/show'
 # get 'service/edit'
 # get 'service/index', :as => :service_index
 # get 'service/new', :as => :service_new
 # get 'service/show', :as => :service_show
 # get 'service/edit', :as => :service_edit
  get 'home' => 'welcome#home'
  get 'about' => 'welcome#about'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end