CddAdvisor::Application.routes.draw do
  resources :images

  resources :labels

  resources :buttons

  resources :knobs

  resources :switches

  resources :handles

  resources :proposals

  resources :projects do
    get :results, on: :member
  end

  root :to => 'projects#index'
end
