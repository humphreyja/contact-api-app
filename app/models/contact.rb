class Contact
  attr_accessor :name, :email, :phone_number, :version, :updated_at

  def initialize(hash = {})
    @name = hash["name"]
    @email = hash["email"]
    @phone_number = hash["phone_number"]
    @version = hash["version"]
  end

  def to_partial_path
    "contacts/contact"
  end

  def touch
    @updated_at = DateTime.now
  end
end
