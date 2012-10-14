class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :request_tags
  has_many :requests, :through => :request_tags

  has_many :user_tags
  has_many :users, :through => :user_tags

end
