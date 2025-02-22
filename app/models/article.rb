class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  # Basic search implementation
  def self.search(query)
    where('title LIKE ? OR content LIKE ?', "%#{query}%", "%#{query}%")
  end
end
