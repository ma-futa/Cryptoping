# crypto_ping_v1

A new Flutter project.

## Getting Started

This project is a dispaly head to showcase my cloud and devops skills


learning to implemet amplify as well
1. install amplify cli 
2. $ amplify configure
3. add to pubspec.yaml
amplify_flutter: ^0.6.0
4. $ amplify init
5. amplify status 

amplify auth
1. amplify_auth_cognito: ^0.6.6 to pubspec
2. $ amplify add auth
3. amplify push
4.  @override
  initState() {
    super.initState();
    _configureAmplify();
  }
  Future<void> _configureAmplify() async {
    // Add any Amplify plugins you want to use
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);

    // You can use addPlugins if you are going to be adding multiple plugins
    // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }
