Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'search', to: "search#index"
  
  # Defina as rotas RESTful para o recurso moradores
  resources :moradors do
    delete 'delete', on: :member, to: 'moradors#destroy', as: 'delete'
    collection do
      get 'search'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'welcome#index'
end
