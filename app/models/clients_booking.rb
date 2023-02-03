class ClientsBooking < ApplicationRecord
  belongs_to :client
  belongs_to :booking
end
