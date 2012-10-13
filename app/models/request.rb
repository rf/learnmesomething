class Request < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :as => :taggable
  has_many :responses

  attr_accessible :description, :downvotes, :title, :upvotes
end
