class Response < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  attr_accessible :downvotes, :response, :title, :upvotes, :url
end
