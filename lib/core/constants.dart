const demoArticle =
    '''\n \n If your Flutter app talks to a 3rd party API that requires an API key, where should you store it?

According to various sources, for production apps that need maximum security:

the API key should be stored on your own secure server (and never on the client)
it should never be transmitted back to the client (to prevent man-in-the-middle attacks)
the client should only communicate with your server, which acts as a proxy for the 3rd party API you intend to use
This is because storing API keys on the client is insecure and can cause various issues if they become compromised.

But not all keys are created equal: some keys can be accessed by the client while others must be secret and stored securely on the server (the Stripe documentation does a good job explaining this).

In fact, this answer on StackOverflow offers a good summary:''';
