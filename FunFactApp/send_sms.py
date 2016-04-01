# Download the twilio-python library from http://twilio.com/docs/libraries
from twilio.rest import TwilioRestClient

# Find these values at https://twilio.com/user/account
account_sid = account_sid
auth_token = auth_token
client = TwilioRestClient(account_sid, auth_token)

message = client.messages.create(to="+6464987345", from_="+6123159166",
                                 body="Hello there!")