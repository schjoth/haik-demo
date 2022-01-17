import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:haikapp/screens/home_screen.dart';
import 'package:haikapp/screens/my_pages_screen.dart';
import 'package:haikapp/screens/trips_screen.dart';
import 'package:haikapp/widgets/navbar/bottom_navbar.dart';
import 'package:haikapp/wrappers/authentication_wrapper.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/autentication_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AutenticationService>(
            create: (_) => AutenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              initialData: null,
              create: (context) =>
                  context.read<AutenticationService>().authStateChanges),
        ],
        child: MaterialApp(
          title: 'Haik app',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, _) => Scaffold(
              appBar: AppBar(
                title: const Center(child: Text("Haik")),
              ),
              body: Overlay(initialEntries: [
                OverlayEntry(
                  builder: (_) => Navigator(
                    initialRoute: HomeScreen.routeName,
                    onGenerateRoute: (settings) {
                      switch (settings.name) {
                        case HomeScreen.routeName:
                          return MaterialPageRoute(
                              builder: (_) => const HomeScreen());
                        default:
                          return MaterialPageRoute(
                              builder: (_) => const HomeScreen());
                      }
                    },
                  ),
                )
              ]),
              bottomNavigationBar: const BottomNavBar()),
          /*
            routes: {
              HomeScreen.routeName: (context) =>
                  const AuthenticationWrapper(child: HomeScreen()),
              TripsScreen.routeName: (context) =>
                  const AuthenticationWrapper(child: TripsScreen()),
              MyPagesScreen.routeName: (context) =>
                  const AuthenticationWrapper(child: MyPagesScreen()),
            })*/
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
