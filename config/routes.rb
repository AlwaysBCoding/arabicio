Arabicio::Application.routes.draw do

root to: "pages#homepage"
post "/parse-word" => "pages#parse_word", as: :parse_word
post "/parse-subform" => "pages#parse_subform", as: :parse_subform

get "/new-stem" => "pages#new_stem", as: :new_stem
post "/new-stem" => "pages#create_stem", as: :create_stem

end
