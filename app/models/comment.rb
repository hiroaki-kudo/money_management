class Comment < ApplicationRecord
  belongs_to :treasurer
  validates :content, presence: true
end
