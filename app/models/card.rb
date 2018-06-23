class Card < ApplicationRecord
  belongs_to :board
  belongs_to :list
  acts_as_list scope: :list
end
