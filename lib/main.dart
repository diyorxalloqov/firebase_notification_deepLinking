import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/api/firebase_api.dart';
import 'package:firebase_notification/firebase_options.dart';
import 'package:firebase_notification/ui/home_page.dart';
import 'package:flutter/material.dart';

/* DOCUMENTATION

  npm install -g firebase-tools

  flutterfire configure

 */

final navigatiorKey = GlobalKey<NavigatorState>();

/////   for background messaging working on background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage((_firebaseMessagingBackgroundHandler));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
