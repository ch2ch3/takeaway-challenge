require_relative 'tokens'

module Twilio

  def send_message
    account_sid = Tokens::ACCOUNT_SID 
    auth_token = Tokens::AUTH_TOKEN
    delivery_time = Time.now + 3600
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create({
      :from => '+441994342030', 
      :to => Tokens::PHONE_NUMBER,
      :body => "Excellent choice of food! Your order will be with you by #{delivery_time.hour}:#{'%02d' %delivery_time.min}."
    })
  end

end