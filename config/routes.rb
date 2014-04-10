Blog::Application.routes.draw do
  resources :posts do resources :reviews end
  
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  get '/post/admi' => 'posts#admi'
  get '/post/report' => 'posts#report'
  get '/post/:id' => 'posts#like'
  get '/post/edit/:id' => 'posts#edit'
  get '/post/dislike/:id' => 'posts#dislike'
  post '/post' => 'posts#create'
  post '/post/:id' => 'posts#update'
  get '/post/delete/:id' => 'posts#delete'
  get '/post/show/:id' => 'posts#show'


  get '/review/:id' => 'reviews#like'
  
  root 'posts#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
