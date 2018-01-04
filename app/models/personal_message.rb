class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :chel
  validates :body, presence: true
end
