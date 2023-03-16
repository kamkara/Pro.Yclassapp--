Rails.application.routes.draw do
  resources :exercises
   resources :courses, only:[:show] do
    resources :exercises, only:[:new, :create, :destroy, :edit, :update]
    get "exercises", to:"exercises#index"
  end
  resources :articles, except: [:new]
  resources :courses, except:[:index, :show, :new]
  resources :questions, except:[:new, :create, :destroy]
  resources :materials, :levels, :citynames
  
  devise_scope :user do
    get 'profil', to: 'devise/registrations#edit'
    get 'student-sign-in', to: 'devise/sessions#new'
    get 'student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete 'deconnecter',  to: "devise/sessions#destroy", as: "destroy_user_session_path"
  end
devise_for :users

  get "new-course", to:"courses#new"
  get "new-level", to:"levels#new"
  get "new-material", to:"materials#new"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
