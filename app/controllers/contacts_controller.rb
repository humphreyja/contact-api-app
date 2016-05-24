class ContactsController < ApplicationController
  include ApplicationHelper
  def new
    @contact = Contact.new
  end

  def create
    if params["contact"] && !params.dig("contact","name").empty?
      c = Contact.new(params["contact"])
      c.touch
      response = RestClient.post("#{ENV['API_URL']}/user/contacts", {api_token: ENV["APIKEY"], auth_token: get_user, contact: c.to_json})
    elsif params["smart"]
      response = RestClient.post("#{ENV['API_URL']}/user/smarttext", {api_token: ENV["APIKEY"], auth_token: get_user, smarttext: params["smart"]})
    end

    if response
      json_res = JSON.parse(response)
      c = Contact.new(json_res)
      logger.ap json_res
      redirect_to contacts_path
    else
      render :new
    end
  end

  def index
    res = RestClient.get("#{ENV['API_URL']}/user/contacts", params: {api_token: ENV["APIKEY"], auth_token: get_user})
    json_res = JSON.parse(res)
    logger.ap json_res
    hash_to_contacts(json_res["data"])
  end

  def show
    res = RestClient.get("#{ENV['API_URL']}/user/contact/#{params[:id]}", params: {api_token: ENV["APIKEY"], auth_token: get_user})
    @contact = Contact.new(JSON.parse(res))
  end

  def hash_to_contacts(hash)
    @contacts = []
    hash.each do |c|
      contact = Contact.new(c)
      @contacts << contact
    end
  end

end
