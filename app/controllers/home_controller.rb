class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def search
    # separate the query into tags and questions
    query = params[:query].split.reduce ({tags: [], q: []}) do |memo, item|
      if /#.*/.match item 
        memo[:tags].push item
      else
        memo[:q].push item
      end

      memo
    end

    query[:q] = query[:q].join ' '

    # now we have query[:tags] which is an array of tags and query[:q] which is
    # the question string if applicable
    puts query.inspect

    @data = query[:tags].reduce [] do |memo, item|
      memo.concat Request.joins(:tags).where('tags.name' => item[1..-1])
    end

    if not query[:q].blank?
      @data.concat Request.find(:all, :conditions => ['title LIKE ?', "%#{query[:q]}%"])
    end
  end
end
