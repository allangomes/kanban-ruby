class Card < ApplicationRecord
  belongs_to :board
  belongs_to :list
end
