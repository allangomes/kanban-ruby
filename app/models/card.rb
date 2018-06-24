# ApplicationRecord
class Card < ApplicationRecord
  validates :title, presence: true, length: { in: 2..30 }
  validates_presence_of :position, on: :update

  belongs_to :board, required: true
  belongs_to :list, required: true

  acts_as_list scope: :list
end
