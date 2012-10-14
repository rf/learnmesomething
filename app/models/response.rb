require 'net/http'
require 'uri'

class Response < ActiveRecord::Base
  belongs_to :request
  belongs_to :user

  attr_accessible :downvotes, :response, :title, :upvotes, :url, :request_id, :user_id

  validates_presence_of :user
  validates_presence_of :request
  validates_presence_of :url

  validates_format_of :url, :with => URI::regexp(%w(http https))

  before_save :update_response
  before_save :ensure_response

  def total_votes
    upvotes - downvotes
  end

  def update_response
    url = URI.parse("http://access.alchemyapi.com/calls/url/URLGetText?apikey=94b629cfbcff4d82104d6f253b074874a80dc29a&url=#{self.url}&outputMode=json")
    full_path = (url.query.blank?) ? url.path : "#{url.path}?#{url.query}"
    the_request = Net::HTTP::Get.new(full_path)

    the_response = Net::HTTP.start(url.host, url.port) { |http|
      http.request(the_request)
    }

    json_body = JSON.parse(the_response.body)

    self.response = json_body["text"]
  end

  def ensure_response
    !self.response.blank?
  end
end
