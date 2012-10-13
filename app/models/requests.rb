class Requests < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :downvotes, :title, :upvotes
end
