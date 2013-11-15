LifeChurchApp::Application.routes.draw do
 
 
  get "ministry_picture_children/step_1"
  get "ministry_picture_children/step_2"
  resources :ministry_picture_children


  resources :ministry_children


  get "ministry_pictures/step_1"
  get "ministry_pictures/step_2"
  resources :ministry_pictures


  resources :ministries


  get "speaker_pictures/step_1"
  get "speaker_pictures/step_2"
  resources :speaker_pictures


  resources :speakers


  resources :sermons


  get "event_pictures/step_1"
  get "event_pictures/step_2"
  resources :event_pictures
  
 

 get 'learn_more/:id' => 'events#learn_more', :as => 'learn_more'

  resources :events


  resources :service_times


  get "church_staff_pictures/step_1"
  get "church_staff_pictures/step_2"

  resources :church_staff_pictures


    get "site_setups/site_setup"
    
  resources :staff_ranks


  resources :site_setups

 get "church_staffs/current_staff"
 #match 'current_staff' => 'church_staffs#current_staff', :as => 'church_staff', :via => :get 
 
  resources :church_staffs

# match 'general-info' => 'abouts#index', :as => 'abouts', :via => :get 

  post 'abouts/contact' 
  get "abouts/home"
  root :to => 'abouts#home'
  get "abouts/mission_method"
  get "abouts/what_we_believe"
  get "abouts/facility"
  get "abouts/membership"
  get "abouts/giving"
  get "abouts/become_a_believer"
  resources :abouts


  authenticated :user do
     root :to => 'abouts#home'  #root :to => 'home#index'
  end
  
  devise_for :users
  resources :users
  
  match 'contact_event' => 'contact_event#new', :as => 'contact_event', :via => :get
  match 'contact_event' => 'contact_event#create', :as => 'contact_event', :via => :post

  match 'contact_staff' => 'contact_staff#new', :as => 'contact_staff', :via => :get
  match 'contact_staff' => 'contact_staff#create', :as => 'contact_staff', :via => :post  

  match 'contact_tech' => 'contact_tech#new', :as => 'contact_tech', :via => :get
  match 'contact_tech' => 'contact_tech#create', :as => 'contact_tech', :via => :post
  
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post
end