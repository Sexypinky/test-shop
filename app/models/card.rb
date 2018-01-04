class Card < ApplicationRecord
  validates :country,:price,:cc, presence: true
end
