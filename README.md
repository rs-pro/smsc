# smsc_client
Client for https://smsc.ru/ service. Can be used only in Ruby on rails framework.

## usage
    sms_client = SmscClient::Sms.new(login, password)
    sms_client.send(phone, text)
