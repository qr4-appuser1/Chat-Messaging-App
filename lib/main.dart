import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:chat/amplifyconfiguration.dart';
import 'package:chat/endToendChat/Store/chatstore.dart';
import 'package:chat/endToendChat/Store/userstore.dart';
import 'package:chat/models/ModelProvider.dart';
import 'package:chat/providers/message_provider.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:chat/screens/welcome/welcome_screen.dart';
import 'package:chat/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await configure();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => MessageProvider()),
        ChangeNotifierProvider<ChatStore>(
          create: (_) => ChatStore(),
          lazy: false,
        ),
        ChangeNotifierProvider<UserStore>(
          create: (_) => UserStore(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    ),
  );
}
Future<void> configure() async {
  try{
    final api = AmplifyAPI(modelProvider:ModelProvider.instance );
    final _dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    final auth = AmplifyAuthCognito();
    await Amplify.addPlugins([api,auth,_dataStorePlugin]);
    await Amplify.configure(amplifyconfig);
    safePrint("Amplify Configure Succesfully");
  }catch(e){
    safePrint("Error Configure:$e");

  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Flutter Way',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      themeMode: ThemeMode.dark,
      home: const WelcomeScreen(),
    );
  }
}
