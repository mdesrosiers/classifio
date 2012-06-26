Classifio::Application.routes.draw do
  scope 'api' do
    resources :classifieds
  end

  root to: "main#index"

  match '*path', to: 'main#index'
end
