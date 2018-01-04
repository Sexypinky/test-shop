class Transaction < ApplicationRecord
  validates :summa, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." },numericality: { only_integer: true }
end
