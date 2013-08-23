BigAl::Application.routes.draw do

  authenticated :user do
    root to: 'static_pages#news'
  end

  root to: 'static_pages#home'

  devise_for :users

  resources :users do
    resources :projects  
    resources :templates
    resources :sharedmessages
    resources :pools do
      resources :libraries
    end
    resources :libraries
  end 

  resources :sharedmessages

  resources :projects do
    resources :mianes
    resources :myfiles
    resources :samples do
      resources :libraries
    end
  end

  resources :templates do
    resources :pgmruns

  end
  
  resources :states do
    resources :projects
  end    

  resources :categories

  resources :events

  resources :inventories

  resources :pools do
    resources :lib5ul
  end

  resources :libraries

  resources :lib5ul

  resources :pgmruns

  resources :tags

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/calendar', to: 'static_pages#calendar'
  match '/gantt', to: 'static_pages#gantt'

  match '/not_approved_projects' => 'projects#not_approved_projects',
        :as => 'not_approved_projects'

  match '/my_inventories' => 'inventories#my_inventories',
        :as => 'my_inventories'

  match '/update_libraries', to: 'templates#update_libraries', 
        :as => 'update_libraries'

  match '/validate_template/:id', to: 'templates#validate_template',
        :as => 'validate_template'

  match '/my_libraries' => 'libraries#my_libraries',
        :as => 'my_libraries'

  match '/create_pool' => 'pools#new',
        :as => 'create_pool'

  match '/create_template' => 'templates#new',
        :as => 'create_template'

  match '/create_pgmrun' => 'pgmruns#new',
        :as => 'create_pgmrun'

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
