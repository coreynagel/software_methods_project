class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost

  validates_presence_of :user_id
  validates_presence_of :micropost_id

end
