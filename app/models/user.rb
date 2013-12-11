class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  attr_accessible :password, :password_confirmation

  has_secure_password

  has_many :microposts , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :wall, dependent: :destroy

  before_save { self.wall = Wall.create! }

  has_many :relationships , dependent: :destroy
  has_many :friends, through: :relationships, conditions: "confirmed =  'accepted'"
  has_many :outgoing_pending_friends, through: :relationships, source: :friend, conditions: ["confirmed = 'pending'"]
  has_many :incoming_pending_friends, through: :relationships, source: :friend, conditions: ["confirmed = 'requested'"]

  before_save { self.first_name.downcase! }
  before_save { self.first_name.capitalize! }
  before_save { self.last_name.downcase! }
  before_save { self.last_name.capitalize! }

  before_save { self.email.downcase! }
  before_save :create_remember_token

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
  format: { with: VALID_EMAIL_REGEX },
  uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def request_friend(other_user)
    transaction do
      relationships.create!([friend_id: other_user.id, confirmed: 'pending' ])
      other_user.relationships.create!([friend_id: self.id, confirmed: 'requested'])
    end
  end

  def accept_friend(new_friend)
    if relationships.find_by_friend_id(new_friend).confirmed == 'requested'
      transaction do
        relationships.find_by_friend_id(new_friend.id).update_attribute(:confirmed, 'accepted')
        new_friend.relationships.find_by_friend_id(self.id).update_attribute(:confirmed, 'accepted')
      end
    end
  end

  def unfriend(friend)
    relationships.find_by_friend_id(friend.id).destroy
    friend.relationships.find_by_friend_id(self.id).destroy
  end

  def mutual_friends(friend)
    mutual = []
    friends.each do |f|
      if friend.friends.include?(f)
         mutual << f
      end
    end
    mutual.delete(friend)
    return mutual
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
