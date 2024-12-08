class User < ApplicationRecord
  has_many :workspaces
  has_many :bookings
end
