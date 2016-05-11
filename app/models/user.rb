class User
  attr_accessor :first_name, :last_name, :id, :username

  def initialize(hash = {})
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @username = hash["username"]
    @id = hash["id"]
  end
end
