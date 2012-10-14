class RequestsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @request = Request.new
  end

  def create
    @request = Request.create(params[:request])
    @request[:user_id] = params[:user_id]
    @request[:upvotes] = 0
    @request[:downvotes] = 0
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, :notice => 'Request has been created.' }
        format.json { render :json => @request, :status => :created, :location => @request }
      else
      	format.html { render :action => "new" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
  end

  def edit

  end

  def destroy

  end
end
