class Management < ApplicationRecord
  belongs_to :kid, class_name: 'User', foreign_key: :kid_id
  belongs_to :parent, class_name: 'User', foreign_key: :parent_id
  has_many :treasurers, dependent: :destroy
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }


  before_save :same_email_stop
  def same_email_stop
    throw(:abort) if email == "guest@guest.com"
  end
end
