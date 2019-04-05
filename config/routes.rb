Rails.application.routes.draw do
  get 'sensors/:sensor_type', to: 'sensor#show'
  post 'sensors/:sensor_type', to: 'sensor#create'
  delete 'sensors/:sensor_type', to: 'sensor#delete'

  post 'devices', to: 'device#create'
  get 'devices', to: 'device#index'
  get 'devices/:device_id', to: 'device#show'
  delete 'devices/:device_id', to: 'device#delete'
end
