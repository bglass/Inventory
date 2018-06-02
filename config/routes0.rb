Rails.application.routes.draw do
  get 'show/*item'             => 'item#show'
  get 'show/'                  => 'item#locations'
end
