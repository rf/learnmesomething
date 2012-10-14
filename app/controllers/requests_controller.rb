class RequestsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @response = @request.responses.new
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.create(params[:request])
    @request[:upvotes] = 0
    @request[:downvotes] = 0
    @request.user = current_user
    @request.save
    tags = params[:tags]
    tokens = tags.split(',')
    tokens.each do |token| 
      tag = Tag.find_or_create_by_name(token.downcase.strip)
      requesttag = RequestTag.create(:request_id => @request.id,
                                     :tag_id => tag.id)
      #requesttag.request = @request
      #requesttag.save
    end

    respond_to do |format|
        format.html { redirect_to request_path(@request), :notice => 'Request has been created.' }
  end
  end

  def update
    @request = Request.find(params[:id])
    respond_to do |format|
      if @request.update_attributes(params[:request])
      	format.html { redirect_to request_path(@request), :notice => 'Requests have been updated.' }
      else
      	format.html { render :action => "edit" }
      end
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_path }
    end
  end
end
