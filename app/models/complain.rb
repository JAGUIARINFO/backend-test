class Complain < ApplicationRecord
  validates_presence_of :title, :description, :city, :state, :country, :company
end
