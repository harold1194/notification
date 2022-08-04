import 'package:flutter/material.dart';
import 'package:noti_app/services/notification.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Consumer<NotificationService>(
              builder: (context, model, _) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => model.instantNotification(),
                        child: Text("Instant Notification"),
                      ),
                      ElevatedButton(
                        onPressed: () => model.imageNotification(),
                        child: Text("Image Notification"),
                      ),
                      ElevatedButton(
                        onPressed: () => model.stylishNotification(),
                        child: Text("Media Notification"),
                      ),
                      ElevatedButton(
                        onPressed: () => model.scheduledNotification(),
                        child: Text("Scheduled Notification"),
                      ),
                      ElevatedButton(
                        onPressed: () => model.cancelNotification(),
                        child: Text("Cancel Notification"),
                      ),
                    ],
                  )),
        ),
      ),
    );
  }
}
