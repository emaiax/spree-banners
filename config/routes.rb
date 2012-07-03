Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :banners do
      collection do
        post :update_positions
      end
      resources :taxons do
        member do
          get :select_taxon
          delete :remove_taxon
        end
        collection do
          post :available_taxons
          get  :selected_taxon
        end
      end
    end
  end
end
