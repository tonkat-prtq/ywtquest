Rails.application.routes.draw do
  devise_for :models
  root to: 'landings#home'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
