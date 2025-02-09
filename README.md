# RedM Logging


## Prerequisites

2. **Discord Webhook URL**: You will need to create a Discord webhook for the logging functionality.
   
   - Go to your Discord channel and create a webhook by navigating to **Server Settings** > **Integrations** > **Webhooks** > **Create Webhook**.
   - Copy the **Webhook URL**; you will need this for configuration.

## Installation Steps

### 1. Configure the Script

1. Open the `server.lua` file located in the `redm-logging-script` folder.
2. Modify **Line 1** to replace `"WEB_URL"` with your **Discord Webhook URL**:

   ```lua
   local webhookUrl = "https://discord.com/api/webhooks/your-webhook-url"
