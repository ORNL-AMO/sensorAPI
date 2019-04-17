class Pump < ApplicationRecord
  belongs_to :device, dependent: :destroy
end
