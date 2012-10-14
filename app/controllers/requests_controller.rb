class RequestsController < ApplicationController
  def new
    @request = User.find(params[:user_id])
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
    respond_to do |format|
      if @request.update_attributes(params[:request])
      	format.html { redirect_to requests_path, :notice => 'Requests have been updated.' }
        format.json { render :json => @request, :status => :created, :location => @request }
      else
      	format.html { render :action => "edit" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
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
