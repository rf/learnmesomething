class Tag < ActiveRecord::Base
  belongs_to :request
  attr_accessible :name
end
