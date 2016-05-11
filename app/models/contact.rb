class Contact
  attr_accessor :first_name, :last_name, :email, :phone_number

  def initialize(hash = {})
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @phone_number = hash["phone_number"]
  end

  def to_partial_path
    "contacts/contact"
  end
end
