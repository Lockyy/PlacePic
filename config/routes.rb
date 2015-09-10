Rails.application.routes.draw do

  get '/', to: 'test#show', as: :test

end