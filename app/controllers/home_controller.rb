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
    # separate the query into tags and questions
    query = params[:query].split.reduce ({tags: [], q: ""}) do |memo, item|
      if /#.*/.match item 
        memo[:tags].push item
      else
        memo[:q] += " " + item
      end
      memo
    end

    # now we have query[:tags] which is an array of tags and query[:q] which is
    # the question string if applicable
    #puts query.inspect
    #@data = query[:tags].reduce [] do |memo, item|
    #  
    #  memo.concat Request.joins(:tags).where(
    #    'tags.name = ? AND requests.title LIKE ?',
    #    item,
    #    '%' + query[:q] + '%'
    #  )
    #end
    @data = []
    tags = query[:tags]
    tags.each do |tag|
      request = Request.joins(:tags).where('tags.name' => tag)
      @data.concat request
    end
    
  end
end
