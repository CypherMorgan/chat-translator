# **FiveM Chat Translate Script**

A standalone script that translates chat messages to the player's client language using the Google Translate API.

### **Features:**
- Translates any chat message into the client's preferred language.
- Standalone and easy to configure.
- Detects client language automatically or defaults to English.

---

## **Installation:**

1. **Download and Install:**
   - Create a new folder in your `resources` directory (e.g., `resources/[scripts]/chat-translate`).
   - Place the `fxmanifest.lua`, `server.lua`, and `client.lua` files into this folder.

2. **Google Translate API Key:**
   - Obtain a Google Translate API key from the [Google Cloud Console](https://console.cloud.google.com/).
   - Open the `client.lua` file and replace `'YOUR_GOOGLE_TRANSLATE_API_KEY'` with your actual API key.

3. **Add to Server Configuration:**
   - Open your `server.cfg` file and add the following line:
     ```
     ensure chat-translate
     ```

---

## **Usage:**

- The script captures any chat message sent using the `/say` command.
- The message is automatically translated based on the client's language.
- If no language is detected, it defaults to English.

---

## **Configuration:**

- The script detects the player's language using the `GetConvar('locale', 'en')` function. If the locale is not set, it will translate the message to English.
- You can modify the default language by editing the `client.lua` file and changing `'en'` to any other [language code](https://cloud.google.com/translate/docs/languages).

---

## **Requirements:**

- **FiveM Server** – The script is designed to work on any FiveM server.
- **Google Translate API Key** – You'll need an API key from Google Cloud to use the translation service.

---