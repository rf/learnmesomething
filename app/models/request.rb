class Request < ActiveRecord::Base
  belongs_to :user
  has_many :responses

<<<<<<< HEAD
  attr_accessible :description, :downvotes, :title, :upvotes, :user_id
=======
  has_many :request_tags
  has_many :tags, :through => :request_tags
  
  attr_accessible :description, :downvotes, :title, :upvotes
>>>>>>> 319f2a9... fixed the associations

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user

  accepts_nested_attributes_for :tags

  def total_votes
    upvotes - downvotes
  end
end
