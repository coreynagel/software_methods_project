class Comment < ActiveRecord::Base
	attr_accessor :content
	belongs_to :user, :micropost

	validates :user_id, presence: true
  	validates :content, presence: true, length: { maximum: 400 }

  	default_scope order: 'comments.created_at DESC'
end
