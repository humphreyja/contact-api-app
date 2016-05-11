ContactApiApp::Application.routes.draw do
    root "users#new"
    resources :users
    resources :access
    resources :contacts
end
