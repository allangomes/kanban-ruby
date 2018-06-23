# Board Model
class Board < ApplicationRecord
  validates :title, presence: true, length: { in: 5..30 }

  # model association
  has_many :lists, dependent: :destroy
  has_many :cards, dependent: :destroy
end
