LifeChurchApp::Application.routes.draw do
 
 
  resources :staff_ranks


  resources :site_setups


 match 'staff' => 'church_staffs#current_staff', :as => 'church_staff', :via => :get 
 
  resources :church_staffs

 match 'general-info' => 'abouts#index', :as => 'abouts', :via => :get 

  post 'abouts/contact' 
 
  resources :abouts


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
end