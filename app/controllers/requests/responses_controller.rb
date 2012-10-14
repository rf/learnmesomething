class Requests::ResponsesController < ApplicationController
  layout false
  respond_to :html, :js

  before_filter :authenticate_user!, :except => [:index]
  before_filter :fetch_request

  def index
    @responses = @request.responses
  end

  def create
    @response = @request.responses.create(params[:response])
    @response.upvotes = 0
    @response.downvotes = 0
    @response.user = current_user

    if @response.save
      render :status => 201, :json => @response
    else
      render :status => 400, :json => { :errors => @response.errors }
    end
  end

  #def edit
  #  @response = Response.find params[:id]
  #end

  #def update
  #  @response = Response.find params[:id]
  #  if @response.update_attributes params[:response]
  #    redirect_to request_path @response.request, notice: 'Response has been updated'
  #  else
  #    redirect_to edit_request_response_path, notice: 'Failed to save.'
  #  end
  #end

  def destroy
    @response = Response.find params[:id]
    @response.destroy
    redirect_to request_path @response.request, notice: 'Response has been deleted.'
  end

  def upvote
    @response = Response.find params[:id]
    @response.upvotes += 1
    @response.save
    redirect_to request_path @response.request, notice: 'Your vote has been counted'
  end

  def downvote
    @response = Response.find params[:id]
    @response.downvotes += 1
    @response.save
    redirect_to request_path @response.request, notice: 'Your vote has been counted'
  end
  private

  def fetch_request
    @request = Request.find(params[:request_id])
  end
end
