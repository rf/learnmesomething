class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def search
    tags = params[:tags]
    @request_results = []
    tags.each do |tag|
      request = Request.joins(:tag).where('tag.name' => tag)
      request_results.concat request
    end
  end

end
