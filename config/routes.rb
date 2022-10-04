Rails.application.routes.draw do

# 会員用
#devise_for :users, controllers: {
#  registrations: "public/registrations",
#  sessions: 'public/sessions'
#}
 devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  devise_scope :users do
    post 'public/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 会員用
scope module: :public do
#homes
  root to: "homes#top"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  get '/about', to: 'homes#about'
#users
  patch '/users/withdraw', to: 'users#withdraw'
  resources :users, :only => [:update, :edit]
  get '/users/my_page', to: 'users#show'
  get '/users/unsubscribe', to: 'users#unsubscribe'
  get '/users/unsubscribe', to: 'users#unsubscribe'

#movies
  #get 'movies/:id' => "movies#show",as: 'detail'
  resources :movies, :only => [:index,:show] do
    resource :favorites, only: [:create, :destroy]
    resources :movie_comments, only: [:create,:destroy]
  end

#other_contents
  resources :other_contents, :only => [:index, :edit, :show, :create, :update, :destroy ] do
    resource :likes, :only => [:create,:destroy]
    resources :othercontent_comments, only: [:create,:destroy]
  end

#post
 resources :posts, :only => [:index, :update, :show, :create, :destroy, :edit ]
end

# 管理者用
namespace :admin do

#homes
  root to: 'homes#top'

#posts
  resources :posts, :only => [:index, :update, :show, :create, :destroy, :edit ]

#other_contents
  resources :other_contents, :only => [:index, :edit, :show, :update, :destroy ]


#genres
  resources :genres, :only => [:index, :create, :update, :edit ]

#users
  resources :users, :only => [:index, :show, :update, :edit ]

end



end
