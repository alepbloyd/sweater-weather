class UserSerializer

  def initialize(data)
    @id = data.id
    @email = data.email.downcase
    @api_key = SecureRandom.hex(15)
  end

  def response
    {
      "data": {
        "type": "users",
        "id": @id,
        "attributes": {
          "email": @email,
          "api_key": @api_key
        }
      }
    }
  end

end