Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sensors/:sensorType', to: 'sensor#show'
  post 'sensors/:sensorType', to: 'sensor#create'
end
