Rails.application.routes.draw do
    root "welcome#home"

    resources :users, only: [:new, :create, :show]
    get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'
    get 'logout' => 'sessions#destroy'

    resources :attractions do
        post 'rides' => 'rides#create'
    end
end
