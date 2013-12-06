class Relationship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :confirmed

	belongs_to :user
	belongs_to :friend, :class_name => 'User'

  validates_presence_of :friend_id
  validates_presence_of :user_id


  def self.breakup(friend_1, friend_2)
    transaction do
      destroy(find_by_user_id_and_friend_id(friend_1, friend_2))
      destroy(find_by_user_id_and_friend_id(friend_2, friend_1))
    end
  end

end
