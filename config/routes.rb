Rails.application.routes.draw do
  devise_for :users
  get 'landings/home'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
