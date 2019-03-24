Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sensors/:sensorType', to: 'sensor#show'
  post 'sensors/:sensorType', to: 'sensor#create'
  delete 'sensors/:sensorType', to: 'sensor#delete'

  post 'devices', to: 'device#create'
  get 'devices', to: 'device#index'
  get 'devices/:device_id', to: 'device#show'
  delete 'devices/:device_id', to: 'device#delete'
end
