Rails.application.routes.draw do

  resources :tops
  resources :sessions, only:[:new, :create, :destroy]
  resources :users

  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :favorites, only:[:create, :destroy, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at:"/letter_opener"
  end

end
