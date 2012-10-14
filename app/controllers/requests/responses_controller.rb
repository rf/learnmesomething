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

  def edit
    @response = Response.find params[:id]
  end

  def update

  end

  def delete

  end

  private

  def fetch_request
    @request = Request.find(params[:request_id])
  end
end
