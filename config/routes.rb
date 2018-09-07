Rails.application.routes.draw do
  get 'goal_groups/index'

  get 'goals/index'

  get 'measures/index'

  resources :goals ##ODS
  resources :targets ##metas
  resources :indicators ##indicadores
  resources :countries ##paises
  resources :departments ##departamentos
  resources :cities ##ciudades
  resources :measures ##unidades de Medida
  resources :goal_groups ##Grupos ODS
  resources :group_cities ##Grupos de Ciudades
  resources :roles ##Roles

  get 'filter_targets_by_goals' => 'indicators#filter_targets_by_goals'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
