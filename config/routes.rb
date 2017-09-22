Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  get 'home/index'
  # get '/all_book_marks', to: 'book_marks#all_book_marks',as: :all_book_marks
  get '/training_mode', to: 'exam#training'
  get '/challenge_mode', to: 'exam#challenge'
  get '/learn_mode', to: 'exam#learn'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      namespace :exam do
        get "/learned" , :action => "learned"
        get "/challenge/:data_format", :action => "challenge"
        get "/training/:data_format", :action => "training"
        post "/remembered", :action => "remembered"
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
