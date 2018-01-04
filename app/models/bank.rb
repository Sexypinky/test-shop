class Bank < ApplicationRecord
  validates :nomer, :password, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." },numericality: { only_integer: true }
  validates :nomer, :length => {:within => 1..4}
end
