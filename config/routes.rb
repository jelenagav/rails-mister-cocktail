Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :cocktails, only: [:index, :new, :show, :create] do
   resources :doses, only: [:new, :create, :destroy]
   end
end

 Rails.application.routes.draw do
  resources :articles
   root to: 'articles#index'
   resources :articles, except: :index
 end
