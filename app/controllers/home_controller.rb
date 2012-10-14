class HomeController < ApplicationController
  def index
    if user_signed_in?
      @requests = current_user.requests
    else
      @requests = []
    end
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
