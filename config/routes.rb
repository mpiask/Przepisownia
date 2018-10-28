Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :recipes do
    member do
      put 'like', to: "recipes#upvote"
      put 'dislike', to: "recipes#downvote"
    end
  end
  resources :categories

  get 'users', to: 'users#index'
  get 'user/:id', to: 'users#show', as: 'user'

end
