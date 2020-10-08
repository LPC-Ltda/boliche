Rails.application.routes.draw do
  resources :adicionales do
    resources :agregados
  end
  resources :agregados
  resources :clientes do
    resources :registros
  end
  resources :detalle_pedidos do
    resources :agregados
  end
  resources :empleados
  resources :empresas do
    resources :roles
    resources :empleados
    resources :registros
  end
  resources :pedidos do
    resources :detalle_pedidos
  end
  resources :productos do
    resources :detalle_pedidos
  end
  resources :recursos do
    match :tablas, via: :get, on: :collection
  end
  resources :registros do
    resources :pedidos
  end
  resources :roles do
    resources :empleados
  end
  resources :zonas do
    resources :clientes
  end

  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recursos#tablas'

end
