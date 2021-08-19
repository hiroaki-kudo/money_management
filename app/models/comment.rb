class Comment < ApplicationRecord
  belongs_to :treasurer
  belongs_to :user
  validates :content, presence: true
end
