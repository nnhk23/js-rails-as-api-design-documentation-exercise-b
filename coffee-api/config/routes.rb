Rails.application.routes.draw do
  resources 'coffee', only: [:index]
end
