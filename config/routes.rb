LifeChurchApp::Application.routes.draw do
  
  get "schedules/step_1"
  resources :schedules


  get "life_pulse_stock_pictures/step_1"
  resources :life_pulse_stock_pictures


  get "life_pulse_pictures/step_1"
  get "life_pulse_pictures/step_2"
  resources :life_pulse_pictures

  
  resources :life_pulses
 

  resources :site_setups


  match ':status', to: 'errors#show', constraints: {status: /\d{3}/ }
  
  
  match 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'
  resources :announcements


  get "egivings/completed"
    resources :egivings
    
   get "notifications/setting"
     resources :notifications


  resources :summaries


  resources :event_forms


  resources :event_setup_forms


  get "sermon_pictures/step_1"
  get "sermon_pictures/step_2"
  resources :sermon_pictures


  get "bulletins/step_1"
  resources :bulletins


  resources :videos


  resources :articles


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
  
 get "events/events"
 get "events/advertisment"
 get "events/calendar_only"
 get 'learn_more/:id' => 'events#learn_more', :as => 'learn_more'

  resources :events


  resources :service_times


  get "church_staff_pictures/step_1"
  get "church_staff_pictures/step_2"

  resources :church_staff_pictures


    get "site_setups/site_setup"
    
  resources :staff_ranks

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
  get "abouts/terms"
  get "abouts/privacy"
  get "abouts/what_to_expect"
  resources :abouts


  authenticated :user do
     root :to => 'abouts#home'  #root :to => 'home#index'
  end
  
  get "users/index"
  match "users/approve" => 'users#approve'
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