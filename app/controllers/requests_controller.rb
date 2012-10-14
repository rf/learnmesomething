class RequestsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @requests = Request.all
  end
  
  def new
    @request = User.find(params[:user_id])
    @request = Request.new
  end

  def create
    @request = Request.create(params[:request])
    @request[:user_id] = current_user.id
    @request[:upvotes] = 0
    @request[:downvotes] = 0
    respond_to do |format|
      if @request.save
        format.html { redirect_to user_request_path(current_user, @request), :notice => 'Request has been created.' }
      else
      	format.html { render :action => "new" }
      end
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    respond_to do |format|
      if @request.update_attributes(params[:request])
      	format.html { redirect_to user_request_path(current_user, @request), :notice => 'Requests have been updated.' }
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
