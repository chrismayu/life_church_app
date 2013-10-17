LifeChurchApp::Application.routes.draw do
 


  get "event_pictures/step_1"
  get "event_pictures/step_2"
  resources :event_pictures
  
 

 get 'learn_more/:id' => 'events#learn_more', :as => 'learn_more'

  resources :events


  resources :service_times


  get "church_staff_pictures/step_1"

  resources :church_staff_pictures


    get "site_setups/site_setup"
    
  resources :staff_ranks


  resources :site_setups

 get "church_staffs/current_staff"
 #match 'current_staff' => 'church_staffs#current_staff', :as => 'church_staff', :via => :get 
 
  resources :church_staffs

 match 'general-info' => 'abouts#index', :as => 'abouts', :via => :get 

  post 'abouts/contact' 
  get "abouts/home"
  root :to => 'abouts#home'
  
  resources :abouts


  authenticated :user do
     root :to => 'abouts#home'  #root :to => 'home#index'
  end
  
  devise_for :users
  resources :users
  
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
end