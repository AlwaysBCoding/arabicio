Arabicio::Application.routes.draw do

root to: "pages#homepage"

  namespace :api do
    namespace :v1 do
      resources :arabic_stems, only: [:show]
    end
  end

post "/parse-stem" => "pages#parse_stem", as: :parse_stem

get "/new-stem" => "pages#new_stem", as: :new_stem
post "/new-stem" => "pages#create_stem", as: :create_stem

get "/generate-parcel" => "pages#generate_parcel", as: :generate_parcel

end
