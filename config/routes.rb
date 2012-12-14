IntranetSXB::Application.routes.draw do

  devise_for :users

  resources :ragots

  # /gallery
  namespace :gallery do
    root to: 'gallery#index'
    resources :albums, except: :index do
      resources :photos
    end
  end

  # /courses => courses_promos_path
  namespace :courses do
    # /courses/:promo => courses_promos_matters_path
    resources :promos, only: :index, path: '', on: :collection do
      # /courses/:promo/:matters => courses_promo_matter_documents
      resources :matters, only: :index, path: '' do
        # /courses/:promo/:matters/:doc_id => courses_promo_matter_documents(d)
        resources :documents, path: ''
      end
    end
  end

  root to: 'intranet#index'
end
