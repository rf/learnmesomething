class RequestTag < ActiveRecord::Base
  belongs_to :request
  belongs_to :tag
  attr_accessible :title, :body, :request_id, :tag_id
end
