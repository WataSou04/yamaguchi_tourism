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
    resources :tourist_spots, only: [:index, :show]
    get 'reviews/:id/new' => 'reviews#new', as: :make
    get 'reviews/completion' => 'reviews#completion'
    resources :reviews, only: [:create, :show, :destroy]
    post 'reviews/check' => 'reviews#check'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :tourist_spots, only: [:new, :create, :show, :edit, :update]
    resource :map, only: [:show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
