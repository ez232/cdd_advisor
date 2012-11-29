CddAdvisor::Application.routes.draw do
  resources :material_values

  resources :maintenance_values

  resources :finishing_values

  resources :manufacturing_values

  resources :projects, except: [:show, :destroy] do
    get :results, as: :results, on: :member
    resources :proposals, except: [:show, :destroy] do
      get :edit_other_attributes, on: :member
      resources :labels, except: :show
      resources :buttons, except: :show
      resources :knobs, except: :show
      resources :switches, except: :show
      resources :handles, except: :show
    end
  end

  root :to => 'home#index'
end
