class Message
  def self.not_found(record = 'record')
    {  message: "Sorry, #{record} not found." } 
  end

  def self.success(message)
    { status: 200, message: message }
  end
end