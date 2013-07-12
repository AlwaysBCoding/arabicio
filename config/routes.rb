Arabicio::Application.routes.draw do

root to: "pages#homepage"
post "/parse-word" => "pages#parse_word", as: :parse_word

end
