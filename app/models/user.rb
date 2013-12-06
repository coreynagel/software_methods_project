class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  attr_accessible :password, :password_confirmation
  attr_accessible :wall_id, :microposts
  has_secure_password

  has_many :microposts , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :wall, dependent: :destroy

  before_save { self.wall = Wall.create! }

  has_many :relationships , dependent: :destroy
  has_many :friends, through: :relationships, conditions: 'confirmed =  1'
  has_many :pending_friends, through: :relationships, source: :friend, conditions: 'confirmed = 0'

  before_save { self.first_name.downcase! }
  before_save { self.first_name.capitalize! }
  before_save { self.last_name.downcase! }
  before_save { self.last_name.capitalize! }

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def friend(other_user)
    relationship = relationships.create!(friend_id: other_user.id)
    inverse_relationship = other_user.relationships.find_by_friend_id(self.id)
    if inverse_relationship
      relationship.update_attribute(:confirmed, 1)
      inverse_relationship.update_attribute(:confirmed, 1)
    end
  end

  def unfriend(friend)
    relationships.find_by_friend_id(friend.id).destroy
    friend.relationships.find_by_friend_id(self.id).destroy
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
