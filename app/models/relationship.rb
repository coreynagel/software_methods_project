class Relationship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id, :confirmed

	belongs_to :user
	belongs_to :friend, :class_name => 'User'

  validates_presence_of :friend_id
  validates_presence_of :user_id
  validates_presence_of :confirmed

end
