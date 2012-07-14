Classifio::Application.routes.draw do
  scope 'api' do
    resources :classifieds do
      member do
        post :image
      end
    end
  end

  root to: "main#index"

  if Rails.env.test? || Rails.env.development?
    mount Jasminerice::Engine, at: "/jasmine"
  end

  match '*path', to: 'main#index'
end
