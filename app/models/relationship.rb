class Relationship < ActiveRecord::Base
  attr_accessible :friend_id

	belongs_to :user
	belongs_to :friend, :class_name => 'User'

  validates_presence_of :friend_id
end
