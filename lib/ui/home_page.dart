import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "Home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final RemoteMessage message =
    //     ModalRoute.of(context)?.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase and DeepLinking"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(message.notification?.title ?? "error"),
            // Text(message.notification?.body ?? "error"),
            // Text(message.data.toString()),
            TextButton(
                onPressed: () {
                  final Uri uri = Uri(scheme: "tel", path: "+998901657778");
                  launchUrl(uri);
                },
                child: Text("+998901657778")),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  final Uri uri = Uri.parse("https://www.google.com/");
                  launchUrl(uri);
                },
                child: Text("Google")),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  final Uri uri =
                      Uri.parse("https://www.facebook.com/feruz.abdurahimov/");
                  launchUrl(uri);
                },
                child: Text("facebook")),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  final Uri uri = Uri(scheme: "sms", path: "+998907777888");
                  launchUrl(uri);
                },
                child: Text("sms")),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  final Uri uri =
                      Uri(scheme: "mailto", path: "feruzbek6500@gmail.com");
                  launchUrl(uri);
                },
                child: Text("email")),
          ],
        ),
      ),
    );
  }
}
