module Messages
  # Retrieves the current user's message threads.
  # Params: page_number = number(optional) If no page is specified via the parameter, the first page of messages will be displayed.
  def get_messages(page_number = 1)
    # Point the HTTParty GET method at the messages endpoint of Bloc's API.
    # Use HTTParty's header option to pass the auth_token.
    # Use HTTParty's body option to pass the page_number
    response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token },
    body: {
      "page": page_number
      })
    puts "This is page #{page_number} of your messages" if response.success?
    # Parse the JSON document returned in the response into a Ruby hash.
    JSON.parse(response.body)
  end

  # Creates a new message and sends a request to Bloc's API via the HTTParty POST method
  # Params: sender = the sender's email, string | recipient_id = the recipient's id, number | token = the message thread token, string | subject = the message subject, string | text = the message body, string
  def create_message(sender, recipient_id, token, subject, text)
    response = self.class.post(api_url("messages"), headers: { "authorization" => @auth_token },
    body: {
      "sender" => sender,
      "recipient_id" => recipient_id,
      "token" => token,
      "subject" => subject,
      "stripped-text" => text
      })
      puts "Your message was sent!" if response.success?
  end
end
