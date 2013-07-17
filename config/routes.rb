Arabicio::Application.routes.draw do

root to: "pages#homepage"
post "/parse-word" => "pages#parse_word", as: :parse_word
post "/parse-subform" => "pages#parse_subform", as: :parse_subform

end
