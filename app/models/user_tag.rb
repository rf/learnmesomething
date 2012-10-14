class UserTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  # attr_accessible :title, :body
end
