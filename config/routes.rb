Classifio::Application.routes.draw do
  scope 'api' do
    resources :classifieds do
      member do
        post :image
      end
    end
  end

  root to: "main#index"

  match '*path', to: 'main#index'
end
