class Request < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :as => :taggable
  has_many :responses

  attr_accessible :description, :downvotes, :title, :upvotes

  validates_presence_of :title
  validates_presence_of :description

  accepts_nested_attributes_for :tags

  def total_votes
    upvotes - downvotes
  end
end
