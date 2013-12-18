class Micropost < ActiveRecord::Base
	attr_accessible :content, :user_id, :wall_id
  belongs_to :user
  belongs_to :wall

  has_many :comments, dependent: :destroy
  has_many :likes

  validates :user_id, presence: true
  validates :wall_id, presence: true
  validates :content, presence: true, length: { maximum: 400 }

  default_scope order: 'microposts.created_at DESC'

end
