Rails.application.routes.draw do
  get 'goal_groups/index'

  get 'goals/index'

  get 'measures/index'

  resources :goals ##ODS
  resources :targets ##metas
  resources :indicators ##indicadores
  resources :countries
  resources :departments
  resources :cities
  resources :measures
  resources :goal_groups
  resources :group_cities
  resources :roles

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
