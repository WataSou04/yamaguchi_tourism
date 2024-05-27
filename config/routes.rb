Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'customers' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :tourist_spots, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :show, :destroy]
      resource :favorite, only: [:create, :destroy]
    end
    get 'search' => 'tourist_spots#search'
    get 'tagsearch' => 'tourist_spots#tagsearch'
    get 'favorite/show' => 'favorites#show'
    post 'reviews/check' => 'reviews#check'
    get 'comments/:id/new' => 'comments#new', as: :comment_make
    resources :comments, only: [:create, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :tourist_spots, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :reviews, only: [:show, :destroy]
    end
    resources :customers, only: [:index, :show, :edit, :update]
    resources :comments, only: [:destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
