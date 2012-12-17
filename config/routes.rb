CddAdvisor::Application.routes.draw do
  resources :material_values

  resources :maintenance_values

  resources :finishing_values

  resources :manufacturing_values

  resources :projects, except: [:show, :destroy] do
    get :results, as: :results, on: :member
    resources :proposals, except: [:show, :destroy] do
      get :recommendations, as: :recommendations, on: :member
      get :edit_other_attributes, on: :member
      resources :uploads
      resources :labels, except: :show do
        get :recommendations, as: :recommendations, on: :member
      end
      resources :buttons, except: :show do
        get :recommendations, as: :recommendations, on: :member
      end
      resources :knobs, except: :show do
        get :recommendations, as: :recommendations, on: :member
      end
      resources :switches, except: :show do
        get :recommendations, as: :recommendations, on: :member
      end
      resources :handles, except: :show do
        get :recommendations, as: :recommendations, on: :member
      end
    end
  end

  root :to => 'home#index'
end
