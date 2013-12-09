class Comment < ActiveRecord::Base
	attr_accessible :content, :user_id, :micropost_id

	belongs_to :user
	belongs_to :micropost

	validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

 	default_scope order: 'comments.created_at ASC'
end
