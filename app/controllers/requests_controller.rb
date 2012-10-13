class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.create(params[:request])
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
  end

  def edit

  end

  def destroy

  end
end
