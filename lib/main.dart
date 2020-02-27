import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'tabs_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Analytics Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: MyHomePage(
        title: 'Firebase Analytics Demo',
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.analytics, this.observer})
      : super(key: key);

  final String title;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  _MyHomePageState createState() => _MyHomePageState(analytics, observer);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  String _message = '';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _testLogEvent() async {
    await analytics.logEvent(
      name: 'testLogEvent',
      parameters: <String, dynamic>{
        'string': 'tes log event',
        'int': 42,
        'long': 123456789,
        'double': 42.0,
        'bool': true,
      },
    );
    setMessage('tes logEvent succeeded');
  }

  Future<void> _login() async {
    await analytics.logLogin();
    setMessage('login success');
  }

  Future<void> _search() async {
    await analytics.logSearch(searchTerm: 'buku');
    setMessage('search item success');
  }

  Future<void> _setUserProperty() async {
    await analytics.setUserProperty(name: 'favorite_color', value: 'red');
    setMessage('setUserProperty succeeded');
  }

  Future<void> _setUserId() async {
    await analytics.setUserId('abc123');
    setMessage('setUserId succeeded');
  }

  Future<void> _selectContent() async {
    await analytics.logSelectContent(contentType: 'novel', itemId: '1234');
    setMessage('select content success');
  }

  Future<void> _addToChart() async {
    await analytics.logAddToCart(
        itemId: '1234',
        itemName: 'majalah',
        itemCategory: 'buku',
        quantity: 10);
    setMessage('add to chart success');
  }

  Future<void> _addPaymentInfo() async {
    await analytics.logAddPaymentInfo();
  }

  Future<void> _purchaseItem() async {
    await analytics.logEcommercePurchase(
        currency: 'IDR', value: 100000, transactionId: '1234');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.green,
                child: Text('Tes Event'),
                onPressed: _testLogEvent,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Login'),
                onPressed: _login,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Search item'),
                onPressed: _search,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Set User Property'),
                onPressed: _setUserProperty,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Set UserId'),
                onPressed: _setUserId,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Select Content'),
                onPressed: _selectContent,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Add To Chart'),
                onPressed: _addToChart,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Add Payment Info'),
                onPressed: _addPaymentInfo,
              ),
              MaterialButton(
                color: Colors.green,
                child: Text('Purchase'),
                onPressed: _purchaseItem,
              ),
              Text(_message,
                  style:
                      TextStyle(color: Color.fromARGB(255, 0, 155, 0))),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //     child: const Icon(Icons.tab),
          //     onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute<TabsPage>(
          //           settings: const RouteSettings(name: TabsPage.routeName),
          //           builder: (BuildContext context) {
          //             return TabsPage(observer);
          //           }));
          //     }),
        )));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: GridView.count(
//           primary: false,
//           padding: const EdgeInsets.all(20),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           crossAxisCount: 2,
//           children: <Widget>[
//             MaterialButton(
//               color: Colors.green,
//               child: const Text('Tes Event'),
//               onPressed: _testLogEvent,
//               ),
//             MaterialButton(
//               color: Colors.green,
//               child: const Text('Login'),
//               onPressed: _login,
//               ),
//             MaterialButton(
//               color: Colors.red,
//               child: const Text('Search item'),
//               onPressed: _search,
//               ),
//             MaterialButton(
//               color: Colors.green,
//               child: const Text('Set User Property'),
//               onPressed: _setUserProperty,
//               ),
//             MaterialButton(
//               color: Colors.red,
//               child: const Text('Set UserId'),
//               onPressed: _setUserId,
//               ),
//             MaterialButton(
//               color: Colors.green,
//               child: const Text('Select Content'),
//               onPressed: _selectContent,
//               ),
//             MaterialButton(
//               color: Colors.red,
//               child: const Text('Add To Chart'),
//               onPressed: _addToChart,
//               ),
//             MaterialButton(
//               color: Colors.green,
//               child: const Text('Add Payment Info'),
//               onPressed: _addPaymentInfo,
//               ),
//             MaterialButton(
//               color: Colors.red,
//               child: const Text('Purchase'),
//               onPressed: _purchaseItem,
//               ),
//           ],
//         ));
//   }
// }
