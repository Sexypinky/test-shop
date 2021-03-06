class Page < ApplicationRecord
  validates :name, :description, presence: true
  has_many :taggings
  has_many :tags, through: :taggings
  mount_uploader :image, ImageUploader

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
