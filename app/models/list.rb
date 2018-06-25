# List Model
class List < ApplicationRecord
  validates :title, presence: true, length: { in: 2..30 }

  # model association
  belongs_to :board, required: true
  has_many :cards, -> { order(:position) }
end
