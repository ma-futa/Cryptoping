import json
import boto3
import smtplib

from requests import Request, Session
import json
from twilio.rest import Client

client = boto3.client('dynamodb')

def handler(event, context):
#-------------------------------GET ALERTS FROM DATABASE---------------------------------------
  data = client.scan(
    TableName='Alert-qcmfgcwt3ve4fak4fwa3kfv5em-dev'
  )
  alerts = data['Items']
#-----------------------------RETRIEVE SYMBOL CURRENCY PAIR--------------------------

  url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"

  parameters = {
    'start': '1',
    'limit': '50',
  }

  headers = {
    'Accepts': 'application/json',
    'X-CMC_PRO_API_KEY': '63dd0aa2-a508-47f6-8ed6-8b08550fae76',
  }

  session = Session()
  session.headers.update(headers)

  response = session.get(url, headers=headers, params=parameters)

  # pprint.pprint(response.json()['data'][0]["quote"]["USD"]["price"])

  pairs = {}
  for item in response.json()["data"]:
    sym = item["symbol"]
    pri = item["quote"]["USD"]["price"]
    current = { "symbol":sym, "price":pri}
    pairs[sym] = {
        "price":pri
    }
    # print(current)
    # faith.append(current)
  # print(price)

  # print(['name'] + ": " + str(price))
  print(pairs)

  # userList["BTC"]
  #-----------------------------COMPARE ALERTS WITH CRYPTOPROVIDER VALUES--------------------------
  triggered_alerts = []
  for alert in alerts:
      if alert['aboveOrBelow']['S'] == 'above':
          if float(pairs[alert['currency']['S']]['price']) < float(alert['price']['S']):
              print('yes alert is above pairprice')
          #     excetute a trigger
              triggered_alerts.append(alert)
          else:
              print('no alert is below pairprice')
      else:
          if float(pairs[alert['currency']['S']]['price']) > float(alert['price']['S']):
              print('yes alert is below pairprice')
          #     execute a trigger
              triggered_alerts.append(alert)
          else:
              print('no alert is above pairprice')
#----------------------------UPDATE TRIGGERED ALERT FROM ISACTIVE TO TRIGGERED IN DATABSE--------------------------------
  for alert in triggered_alerts:
    response = client.update_item(
        TableName='Alert-qcmfgcwt3ve4fak4fwa3kfv5em-dev',
        Key={'id':  alert['id']},
        ExpressionAttributeNames= {'#isActive':'isActive'},
        UpdateExpression = "SET #isActive = :s",
        ExpressionAttributeValues={':s':{'S': 'false'}}
      
    )

#----------------------------SEND TRIGGERED ALERTS TO NOTIFIER FUNCTION--------------------------
  for alert in triggered_alerts:
    if alert['notificationMethod']['S'] == 'Email':
      sender = 'mohammedfuta2000@gmail.com'
      receivers = ['rhealmohammedfuta@gmail.com']

      message = """From: From Manav mohammedfuta2000@gmail.com
      To: To Manav rhealmohammedfuta@gmail.com
      Subject: CryptoPing Alert
      Hi, your alert has been triggered on CryptoPing.
      """

      gmail_user = "mohammedfuta2000@gmail.com"
      gmail_app_password = "gdlyjbcczfhbfavn"
      sent_from = "mohammedfuta2000@gmail.com"
      sent_to = "rhealmohammedfuta@gmail.com"
      email_text = message

      try:
          server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
          server.ehlo()
          server.login(gmail_user, gmail_app_password)
          server.sendmail(sent_from, sent_to, email_text)
          server.close()

          print('Email sent!')
      except Exception as exception:
          print("Error: %s!\n\n" % exception)
    else:
      account_sid = 'ACed5dcf790f17cf39c1918ffdf5e4ef2d'
      auth_token = '3c4227996f061465f06cbd82b02a26f0'
      client = Client(account_sid, auth_token)

      message = client.messages \
                      .create(
                          body="Hi, your alert has been triggered on CryptoPing",
                          from_='+13023063876',
                          to="+233${alert['notificationMethodValue']['S']}"
                      )

      print(message.sid)
    





  response = { 
      'statusCode': 200,
      'body': json.dumps(data),
      'headers': {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*'
      },
  }
  
  return response