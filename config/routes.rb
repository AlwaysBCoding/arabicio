Arabicio::Application.routes.draw do

root to: "pages#homepage"
post "/parse-stem" => "pages#parse_stem", as: :parse_stem

get "/new-stem" => "pages#new_stem", as: :new_stem
post "/new-stem" => "pages#create_stem", as: :create_stem

end
