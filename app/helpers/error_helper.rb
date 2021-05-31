class ErrorHelper
  def self.standard_error(message)
    {
      status: "Error",
      code: 400,
      messages: message
    }
  end
end
