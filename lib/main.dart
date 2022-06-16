import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'firebase_options.dart';
import 'notification_service.dart';
import 'pages/service/firebase_messaging_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
            create: (context) => NotificationService()),
        Provider<FirebaseMessagingService>(
          create: (context) =>
              FirebaseMessagingService(context.read<NotificationService>()),
        )
      ],
      child: App(),
    ),
  );
}
