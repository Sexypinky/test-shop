class Conversation < ApplicationRecord
  belongs_to :author, class_name: 'chel'
  belongs_to :receiver, class_name: 'chel'
  validates :author, uniqueness: {scope: :receiver}
  has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy
  scope :participating, -> (chel) do
    where("(conversations.author_id = ? OR conversations.receiver_id = ?)", chel.id, chel.id)
  end
  def with(current_chel)
    author == current_chel ? receiver : author
  end
  def participates?(chel)
    author == chel || receiver == chel
  end
end
