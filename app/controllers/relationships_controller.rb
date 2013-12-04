class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def self.request(user, friend)
    unless user == friend or Relationship.exists?(user, friend)
      transaction do
        create(:user => user, :friend => friend, :status => 'pending')
        create(:user => friend, :friend => user, :status => 'requested')
      end
    end
  end
  def self.accept(user, friend)
  	transaction do
  		accepted_at = Time.now
  		accept_single_direction(user, friend, accepted_at)
  		accept_single_direction(friend, user, accepted_at)
  	end
  end
  def self.accept_single_direction(user, friend, accepted_at)
  	request = find_by_user_id_and_friend_id(user, friend)
  	request.status = 'accepted'
  	request.accepted_at = accepted_at
  	request.save!
  end
end
