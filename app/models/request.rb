class Request < ActiveRecord::Base
  belongs_to :user
  has_many :responses

  attr_accessible :description, :downvotes, :title, :upvotes, :user_id
  has_many :request_tags
  has_many :tags, :through => :request_tags

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :user

  accepts_nested_attributes_for :tags

  delegate :url_helpers, to: 'Rails.application.routes' 

  def total_votes
    upvotes - downvotes
  end

  def relative_path
    url_helpers.request_path(self)
  end

  def user_email
    self.user.email
  end

  def as_json(options = {})
    super(options.reverse_merge({ :methods => [:relative_path, :total_votes, :user_email] }))
  end
end
