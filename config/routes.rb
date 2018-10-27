Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
  resources :recipes do
    member do
      put 'like', to: "recipes#upvote"
      put 'dislike', to: "recipes#downvote"
    end
  end
end
