class AccessController < ApplicationController
  include ApplicationHelper
  def new
    @user = User.new
  end

  def edit
    remove_user
    redirect_to new_access_path
  end

  def create
    unless params["user"].nil?
      responce = RestClient.post("#{ENV['API_URL']}/sessions", {api_token: ENV["APIKEY"], user: params["user"]})
      json_res = JSON.parse(responce)
      logger.ap json_res
      set_user(json_res.dig("data", "auth_token"))
      redirect_to contacts_path
    else
      render :new
    end
  end
end
