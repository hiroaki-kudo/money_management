class Management < ApplicationRecord
  belongs_to :kid, class_name: 'User', foreign_key: :kid_id
  belongs_to :parent, class_name: 'User', foreign_key: :parent_id
  has_many :treasurers
end
