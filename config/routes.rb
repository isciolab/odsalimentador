Rails.application.routes.draw do
  get 'goal_groups/index'

  get 'goals/index'

  get 'measures/index'

  resources :goals do ##ODS
    member do
      get "deletegoal" #Esto reconocerá /goals/1/deletegoal con GET
    end
  end

  resources :goal_groups do ##Grupos ODS
    member do
      get 'deletegoalgroup'
    end
  end

  resources :targets do ##metas
    member do
      get 'deletetarget'
    end
  end

  resources :indicators do ##indicadores
    member do
      get 'deleteindicator'
    end
  end

  resources :indicator_values do ##indicadore_value
    get 'newindicadorvalue', on: :collection
    get 'getvalueindicators', on: :collection
    get 'updatefechatoyear', on: :collection
  end

  resources :countries ##paises

  resources :departments do ##departamentos
    member do
      get 'deletedepartment'
    end
  end

  resources :cities do ##ciudades
    member do
      get 'deletecity'
    end
  end

  resources :measures do ##unidades de Medida
    member do
      get 'deletemeasure'
    end
  end
  resources :group_cities do ##Grupos de Ciudades
    member do
      get 'deletegroupcity'
    end
  end

  resources :roles do ##Roles
    member do
      get "deleterole"
    end
  end

  get 'filter_targets_by_goals' => 'targets#filter_targets_by_goals'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_scope :user do
    get 'allusers', to: "devise/sessions#allusers"
    get 'newuser', to: "devise/registrations#newuser"
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'



  #####APIS

  namespace :api do

    resources :cities do
      get "getCities", on: :collection
    end

    resources :goals do
      get "getGoals", on: :collection
    end
    resources :goal_groups do
      get "getGoalGroups", on: :collection
    end
    resources :targets do
      get "getTargets", on: :collection
    end
    resources :indicators do
      get "getIndicators", on: :collection
    end

    resources :group_cities do
      get "getGrupos", on: :collection
    end
  end

end
