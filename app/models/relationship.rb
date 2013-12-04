class Relationship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

	belongs_to :user
	belongs_to :friend, :class_name => 'User', foreign_key: 'friend_id'

  validates_presence_of :friend_id
end
