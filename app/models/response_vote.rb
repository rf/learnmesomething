class ResponseVote < ActiveRecord::Base
  belongs_to :response
  belongs_to :user
  attr_accessible :response_id, :user_id
end
