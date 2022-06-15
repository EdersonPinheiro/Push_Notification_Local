import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valor = false;
  showNotification() {
    setState(() {
      valor = !valor;
      if (valor) {
        Provider.of<NotificationService>(context, listen: false)
            .showNotification(
          CustomNotification(
            id: 1,
            title: 'Test',
            body: 'Bora bora',
            payload: '/notification',
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 254, 174),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Card(
            child: ListTile(
              title: Text('Lembrar mais tarde'),
              trailing: valor
                  ? Icon(
                      Icons.check,
                      color: Colors.amber.shade600,
                    )
                  : Icon(Icons.check_box_outline_blank),
              onTap: showNotification,
            ),
          ),
        ),
      ),
    );
  }
}
