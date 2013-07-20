Arabicio::Application.routes.draw do

root to: "pages#homepage"
post "/parse-word" => "pages#parse_word", as: :parse_word
post "/parse-subform" => "pages#parse_subform", as: :parse_subform

get "/new-root" => "pages#new_root", as: :new_root
post "/new-root" => "pages#create_root", as: :create_root

end
