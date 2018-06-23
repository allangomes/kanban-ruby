# List Model
class List < ApplicationRecord
  # model association
  belongs_to :board
  has_many :cards, -> { order(:position) }
end
