Rails.application.routes.draw do
  get 'landings/home'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
