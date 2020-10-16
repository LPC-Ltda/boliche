Rails.application.routes.draw do
  resources :adicionales do
    match :estado, via: :get, on: :member
    resources :agregados
  end
  resources :agregados do
    match :estado, via: :get, on: :member
  end
  resources :categorias do
    match :estado, via: :get, on: :member
    match :seleccion, via: :get, on: :collection
    resources :productos
  end
  resources :clientes do
    match :estado, via: :get, on: :member
    resources :registros
  end
  resources :detalle_pedidos do
    resources :agregados
  end
  resources :empleados do
    match :estado, via: :get, on: :member
  end
  resources :empresas do
    match :estado, via: :get, on: :member
    resources :roles
    resources :empleados
    resources :categorias
    resources :zonas
    resources :registros
  end
  resources :pedidos do
    match :estado, via: :get, on: :member
    resources :detalle_pedidos
  end
  resources :productos do
    match :estado, via: :get, on: :member
    resources :detalle_pedidos
  end
  resources :recursos do
    match :tablas, via: :get, on: :collection
  end
  resources :registros do
    resources :pedidos
  end
  resources :roles do
    match :estado, via: :get, on: :member
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
