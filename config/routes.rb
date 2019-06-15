Rails.application.routes.draw do

  devise_for :users
  root 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:show, :edit, :update]

resources :shops do
	resources :post_comments, only: [:create,:destroy] #コメント機能
end

end
