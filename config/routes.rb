MyYoga::Application.routes.draw do
  
  resources :activations, only: [ :activate_account, :reset_password_link, :newsletter_subscription ]
  match '/ActivateAccount', :to => 'activations#activate_account'
  match '/ResetPasswordLink', :to => 'activations#reset_password_link'
  match '/ActivateNewsLetterSubscription', :to => 'activations#newsletter_subscription'

  resources :user_sessions
  resources :users

  match '/SignUp', :to => 'home#sign_up'
  match '/SignIn',  to: 'user_sessions#new'
  match '/SignOut', to: 'user_sessions#destroy'
  

  # => Home
  resources :home, only: [:index, :about_us, :contact_us, :sign_in, :sign_up, :sign_out, :forgot_password, :news_letter_subscription]
  match '/Index', :to => 'home#index'
  match '/AboutUs', :to => 'home#about_us'
  match '/ContactUs', :to => 'home#contact_us'
  match '/ForgotPassword', :to => 'home#forgot_password'
  match '/NewLetterSubscription', :to => 'home#news_letter_subscription'

  root :to => 'home#index'
  

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
