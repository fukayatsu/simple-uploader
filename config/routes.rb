SimpleUploader::Application.routes.draw do
  resources :items, path: '', only: [:index, :show, :create] do
    member do
      get :download
      post :destroy
    end
  end
end
