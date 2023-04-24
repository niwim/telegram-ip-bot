# telegram-ip-bot

A simple Telegram bot to receive updates when your public IP changes

## To get started

Open following link to get to the BotFather and create a new bot: https://telegram.me/BotFather

After creating the bot, you will receive a token. Copy this token and paste it into the bot_script.sh file.

### Obtain chat ID

Paste the following link in your browser. Replace <API-access-token> with the API access token that you identified or created in the previous section

`https://api.telegram.org/bot<API-access-token>/getUpdates?offset=0`

Send a message to your bot in the Telegram application. The message text can be anything. Your chat history must include at least one message to get your chat ID.

Refresh your browser.

Identify the numerical chat ID by finding the id inside the chat JSON object. In the example below, the chat ID is 123456789.

```
{
   "ok":true,
   "result":[
      {
         "update_id":XXXXXXXXX,
         "message":{
            "message_id":2,
            "from":{
               "id":123456789,
               "first_name":"Mushroom",
               "last_name":"Kap"
            },
            "chat":{
               "id":123456789,
               "first_name":"Mushroom",
               "last_name":"Kap",
               "type":"private"
            },
            "date":1487183963,
            "text":"hi"
         }
      }
   ]
}
```

Copy it into to bot_script.sh file.

## Setup Cronjob

To automate the process, you can setup a cronjob to run the script every 5 minutes.

Run command

`crontab -e`

and add the following line

`*/5 * * * * /path/to/bot_script.sh`
