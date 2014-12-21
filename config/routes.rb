Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
    end

    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts, only: [:index, :new, :create, :show, :edit, :update]
  get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  resources :users, only: [:show]
end
