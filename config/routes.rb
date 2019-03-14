Rails.application.routes.draw do
  get 'goal_groups/index'

  get 'goals/index'

  get 'measures/index'

  resources :configs do ##ODS
    collection { post 'importheme'}
    collection { post 'importpersons_has_questions'}

    collection { post 'dictionary_objetive'}
    collection { post 'objetive_data'}

    collection { post 'dict_univ_cities'}
    collection { post 'university_cities'}

    collection { post 'eot_data'}
    collection { post 'eot_dictionaryroutes'}

    collection { post 'ods_ciudatos'}

    collection { post 'load_cities'}
    collection { post 'web_pages_cities'}
    collection { post 'description_cities'}


  end

  resources :goals do ##ODS
    collection { post :import}
    get 'goals/import'
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
    collection { post :import}
    get 'targets/import'
    member do
      get 'deletetarget'
    end
    get 'tbltargets', on: :collection
  end

  resources :indicators do ##indicadores
    collection { post :import}
    collection { post 'load_descripcion'}
    get 'indicators/import'
    get 'getindicatorstbl', on: :collection
    member do
      get 'deleteindicator'
    end
  end

  resources :indicator_values do ##indicadore_value
    get 'newindicadorvalue', on: :collection
    get 'getvalueindicators', on: :collection
    get 'updatefechatoyear', on: :collection
    get 'tblindicatorvalue', on: :collection
    collection { post 'importar_indicator_value'}
    collection { post 'importar_value_tres_ref'}

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
    get "tblcities", on: :collection
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
    get 'allusers', to: "users/sessions#allusers"
    get 'newuser', to: "users/registrations#newuser"
    get 'users/:id/edit', to: 'users/registrations#edit',    as: :edit_user
    patch 'users/:id/', to: 'users/registrations#update',    as: :update_user
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
