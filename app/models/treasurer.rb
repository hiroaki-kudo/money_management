class Treasurer < ApplicationRecord
  validates :category_id, :use_what, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
