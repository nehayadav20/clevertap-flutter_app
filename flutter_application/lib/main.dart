import 'package:flutter/material.dart';
import 'package:flutter_application/LoginPage.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';

void main() {
  runApp(const MyApp());
  CleverTapPlugin.setDebugLevel(3);
  CleverTapPlugin.createNotificationChannel(
      "123", "123", "123", 3, true);
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'FLUTTER CLEVERTAP'),
    );
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
  void initState() {
    super.initState();
    CleverTapHandler();
  }
  void CleverTapHandler() {
    CleverTapPlugin _clevertapPlugin = CleverTapPlugin();
    _clevertapPlugin.setCleverTapInboxDidInitializeHandler(inboxDidInitialize);
    _clevertapPlugin
        .setCleverTapInboxMessagesDidUpdateHandler(inboxMessagesDidUpdate);
    _clevertapPlugin
        .setCleverTapDisplayUnitsLoadedHandler(onDisplayUnitsLoaded);
    _clevertapPlugin.setCleverTapPushClickedPayloadReceivedHandler(pushClickedPayloadReceived);
  }
  void pushClickedPayloadReceived(Map<String, dynamic> notificationPayload) {
  print("pushClickedPayloadReceived called with notification payload: " + notificationPayload.toString());
  // You may perform UI operation like redirecting the user to a specific page based on custom key-value pairs
  // passed in the
}


  void inboxMessagesDidUpdate() {
    this.setState(() async {
      print("inboxMessagesDidUpdate called");
    });
  }
  void inboxDidInitialize() {
    this.setState(() {
      print("inboxDidInitialize called");
      var styleConfig = {
        'noMessageTextColor': '#FF6600',
        'noMessageText': 'No message(s) to show.',
        'navBarTitle': 'App Inbox'
      };
      CleverTapPlugin.showInbox(styleConfig);
    });
  }
  void _appInbox() {
    CleverTapPlugin.initializeInbox();
    // CleverTapPlugin.recordEvent("App Inbox Opened", eventData);
  }
  void _profilePush() {
    var dob = '2012-04-22';
    var profile = {
      'dob': CleverTapPlugin.getCleverTapDate(DateTime.parse(dob)),
      'Customer': 'Platinum'
    };
    CleverTapPlugin.profileSet(profile);
  }
  void _addedToCart() {
    var eventData = {
      'Product Name': 'Casio Chronograph Watch',
      'Category': 'Mens Accessories',
      'Price': 59.99
    };
    CleverTapPlugin.recordEvent("Added To Cart", eventData);
  }
  void _charged() {
    var item1 = {
      'Product category': 'books',
      'Book name': 'The Millionaire next door',
      'Quantity': 1
    };
    var item2 = {
      'Product category': 'books',
      'Book name': 'Achieving inner zen',
      'Quantity': 1
    };
    var items = [item1, item2];
    var chargeDetails = {'Amount': 300, 'Payment Mode': 'Credit Card'};
    CleverTapPlugin.recordChargedEvent(chargeDetails, items);
  }
  @override
  void onDisplayUnitsLoaded(List<dynamic>? displayUnits) {
    this.setState(() {
      print("Display Units = " + displayUnits.toString());
    });
  }
  void getAdUnits() {
    this.setState(() async {
      List? displayUnits = await CleverTapPlugin.getAllDisplayUnits();
      print("Display Units Payload = " + displayUnits.toString());
      displayUnits?.forEach((element) {
        var customExtras = element["custom_kv"];
        if (customExtras != null) {
          print("Display Units CustomExtras: " + customExtras.toString());
        }
      });
    });
  }
  void _navigateToNativeDisplay() {
    var eventData = {
      'Button Name': 'Native Display',
      'Action': 'Clicked'
      // Add any additional properties you want to track with the event
    };
    // CleverTapPlugin.recordEvent("Native Display Clicked", eventData);
    // Navigate to Native Display page if needed
  }
  void _navigateToInApp() {
    var eventData = {
      'Button Name': 'In-App Button',
      'Action': 'Clicked'
      // Add any additional properties you want to track with the event
    };
    CleverTapPlugin.recordEvent("In-App Button Clicked", eventData);
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _appInbox,
              child: const Text('App Inbox'),
            ),
            ElevatedButton(
              onPressed: _profilePush,
              child: Text('Profile Push'),
            ),
            ElevatedButton(
              onPressed: _addedToCart,
              child: Text('Added To Cart'),
            ),
            ElevatedButton(
              onPressed: _charged,
              child: Text('Charged'),
            ),
            ElevatedButton(
              onPressed: _navigateToNativeDisplay,
              child: Text('Native Display'),
            ),
            ElevatedButton(
              onPressed: _navigateToInApp,
              child: Text('In-App Button'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}