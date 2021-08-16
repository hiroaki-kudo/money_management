class Treasurer < ApplicationRecord
  validates :category_id, :use_what, presence: true
end
