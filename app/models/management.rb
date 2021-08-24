class Management < ApplicationRecord
  belongs_to :kid, class_name: 'User', foreign_key: :kid_id
  belongs_to :parent, class_name: 'User', foreign_key: :parent_id
  has_many :treasurers, dependent: :destroy
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # validate :stop_messege
  # validate :same_email_stop

  before_validation { email.downcase! }

  # before_validation :same_email_stop
  # def same_email_stop
  #   throw(:abort) if self.email == "guest@guest.com"
    # throw(:abort) if self.email == current_user.email
    # errors.add(:same_email_stop,'登録できないよ')
    # puts "登録できませんでした"
  # end
  # def same_email_stop
  #   errors.add(:email,'はすでに登録されています') if Management.where(parent_id: self.parent_id, kid_id: self.kid_id) != nil
  # end

  # def stop_messege
  #   errors.add(:same_email_stop,'登録できないよ') if self.email == "guest@guest.com"
  # end
end

#
