class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    unless params["user"].nil?
      responce = RestClient.post("#{ENV['API_URL']}/users", {api_token: ENV["APIKEY"], user: params["user"]})
      json_res = JSON.parse(responce)
      u = User.new(json_res)
      logger.ap json_res
      set_user(json_res["auth_token"])
      redirect_to user_path(u.id)
    else
      render :new
    end
  end

  def show
    res = RestClient.get("#{ENV['API_URL']}/users/#{params[:id]}", params: {api_token: ENV["APIKEY"]})
    @user = User.new(JSON.parse(res))
    @token = get_user
  end

  def hash_to_users(hash)
    @users = []
    hash.each do |u|
      user = User.new(u)
      @users << user
    end
  end

end
