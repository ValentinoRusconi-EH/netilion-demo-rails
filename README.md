# Netilion OAuth Flow Showcase in Rails

This Rails application demonstrates the integration of the Netilion OAuth flow, providing a practical example of authenticating users via OAuth in a Ruby on Rails application. The app highlights how to configure and implement OAuth authentication, fetch user details from the Netilion API, and manage user sessions.

## Netilion OAuh Flow 
The official documentation about the Netilion OAuth Flow can be found [here](https://developer.staging-env.netilion.endress.com/first_steps/auth/#auth-flow-for-web-applications).

## Features

- OAuth authentication with the Netilion platform.
- Fetching and displaying user details post-authentication.
- Session management showcasing a typical login and logout flow.

## Prerequisites

Before running this application, ensure you have:

- Ruby and Rails installed on your machine.
- Obtained an OAuth client ID and client secret from Netilion.
- Configured the callback URL in your Netilion application settings to match the redirect URI expected by this Rails application.

## Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/valentinorusconi-eh/netilion-oauth-rails.git
cd netilion-oauth-rails
bundle install
```


## Configuration

Set up your OAuth credentials. Create an .env file in the root directory of the application and add your Netilion OAuth credentials:

```bash
OAUTH_CLIENT_ID=your_netilion_client_id
OAUTH_CLIENT_SECRET=your_netilion_client_secret
OAUTH_SITE=https://api.staging-env.netilion.endress.com
```

## Running the Application

Start the Rails server: 
```bash
rails server
```

Navigate to http://localhost:3000 in your browser to interact with the application.

## Usage

Click the "Login with Netilion" button to initiate the OAuth flow.
After authentication, the application will redirect you back and display your Netilion user details.
Use the "Logout" button to end the session.


## How It Works

OAuth Flow: The application uses the OmniAuth library to handle the OAuth flow with Netilion, obtaining an authorization code and exchanging it for an access token.
User Data: Upon successful authentication, the application fetches user details from Netilion's /current_user endpoint using the obtained access token.
Session Management: The application stores user details in the session, allowing for stateful interaction within the app. A logout feature is also implemented to clear the session.

## Contributing

Feel free to contribute to this project! Whether it's feature requests, bug reports, or code contributions, all forms of collaboration are welcome.

(who needs this in commons?)

