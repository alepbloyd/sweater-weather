class UserSerializer

  def initialize(data)
    @id = data.id
    @email = data.email.downcase
    @api_key = data.api_key
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