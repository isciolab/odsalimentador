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

  get 'filter_targets_by_goals' => 'indicators#filter_targets_by_goals'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'



  #####APIS

  namespace :api do

    resources :cities do
      get "getCities", on: :collection
    end


  end

end
