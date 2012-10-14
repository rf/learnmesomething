class Users::RequestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @requests = @user.requests
  end
end
