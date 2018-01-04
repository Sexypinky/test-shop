class Checkbank < ApplicationRecord
  validates :nomer, :password, presence: true
end
