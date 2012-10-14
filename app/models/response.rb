class Response < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  attr_accessible :downvotes, :response, :title, :upvotes, :url

  validates_presence_of :user
  validates_presence_of :request
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))

  def total_votes
    upvotes - downvotes
  end
end
