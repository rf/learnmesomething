class RequestVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request

  attr_accessible :user_id, :request_id
end
