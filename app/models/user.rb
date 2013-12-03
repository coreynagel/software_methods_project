class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name
  attr_accessible :password, :password_confirmation
  has_secure_password

  has_many :microposts , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :wall, dependent: :destroy

  before_save { self.wall = Wall.create! }

  has_many :relationships
  has_many :friends, :through => :relationships

  has_many :pending_friends,
         :through => :relationships,
         :source => :friend,
         :conditions => "confirmed = 0"

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

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
