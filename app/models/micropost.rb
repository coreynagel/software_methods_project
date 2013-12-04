class Micropost < ActiveRecord::Base
	attr_accessible :content, :user_id, :wall_id
  belongs_to :user
  belongs_to :wall

  validates :user_id, presence: true
  validates :wall_id, presence: true
  validates :content, presence: true, length: { maximum: 400 }

  default_scope order: 'microposts.created_at DESC'

  def self.by_friends_of(user)
    friend_user_ids = "SELECT friend FROM relationships
                         WHERE friend_id = :user_id"
    where("user_id IN (#{friend_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
