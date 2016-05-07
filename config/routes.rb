Rails.application.routes.draw do
  root 'home#index'
  resource :shoe do 
    get :filter
  end
end
