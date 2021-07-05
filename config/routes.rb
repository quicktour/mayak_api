Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :cards, only: [] do
        get 'list' => 'cards#index', on: :collection
        get 'top' => 'cards#top', on: :collection
      end

      resources :feedbacks, only: [] do
        get 'chart' => 'feedbacks#chart', on: :member
      end
    end
  end
end
