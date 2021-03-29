Rails.application.routes.draw do

  get  'new' => 'announcements#new'
  get 'unviewed' => 'announcements#unviewed'
  post 'unviewed' => 'announcements#announcement_view'
  get 'my_posts' => 'announcements#my_posts'
  get 'sessions/new'
  root 'static_pages#home'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users
  resources :announcements

end
