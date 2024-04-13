Rails.application.routes.draw do
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'customers' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :tourist_spots, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :show, :destroy]
      get 'reviews/completion' => 'reviews#completion'
      resource :favorite, only: [:create, :destroy]
    end
    post 'reviews/check' => 'reviews#check'
    get 'comments/:id/new' => 'comments#new', as: :comment_make
    resources :comments, only: [:create, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :tourist_spots, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :reviews, only: [:show, :destroy]
    resources :comments, only: [:destroy]
    resource :map, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
