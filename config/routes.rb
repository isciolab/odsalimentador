Rails.application.routes.draw do
  get 'goal_groups/index'

  get 'goals/index'

  get 'measures/index'

  resources :goals do ##ODS
    member do
      get "deletegoal" #Esto reconocerá /goals/1/deletegoal con GET
    end
  end
  resources :targets ##metas
  resources :indicators ##indicadores
  resources :indicator_values ##indicadore_value
  resources :countries ##paises
  resources :departments ##departamentos
  resources :cities ##ciudades
  resources :measures ##unidades de Medida
  resources :goal_groups ##Grupos ODS
  resources :group_cities ##Grupos de Ciudades
  resources :roles ##Roles

  get 'filter_targets_by_goals' => 'indicators#filter_targets_by_goals'
  get 'newindicadorvalue'=>'indicator_values#newindicadorvalue'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
