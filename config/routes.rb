Rails.application.routes.draw do
root "pages#home"
get 'pages/home', to: 'pages#home'
get 'pages/index', to: 'pages#index'
end
