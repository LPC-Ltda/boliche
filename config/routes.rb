Rails.application.routes.draw do
  resources :adicionales do
    resources :agregados
  end
  resources :agregados
  resources :categorias do
    match :seleccion, via: :get, on: :collection
    resources :productos
  end
  resources :clientes do
    resources :registros
  end
  resources :detalle_pedidos do
    resources :agregados
  end
  resources :empleados
  resources :empresas do
    match :estado, via: :get, on: :member
    resources :roles
    resources :zonas
    resources :empleados
    resources :registros
    resources :categorias
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
    match :seleccion, via: :get, on: :collection
    resources :empleados
  end
  resources :zonas do
    match :estado, via: :get, on: :member
    match :seleccion, via: :get, on: :collection
    resources :clientes
  end

  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recursos#tablas'

end
