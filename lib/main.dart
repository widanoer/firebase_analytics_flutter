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

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        'bool': true,
      },
    );
    setMessage('logEvent succeeded');
  }

  Future<void> _testSetUserId() async {
    await analytics.setUserId('some-user');
    setMessage('setUserId succeeded');
  }

  Future<void> _testSetCurrentScreen() async {
    await analytics.setCurrentScreen(
      screenName: 'Analytics Demo',
      screenClassOverride: 'AnalyticsDemo',
    );
    setMessage('setCurrentScreen succeeded');
  }

  Future<void> _testSetAnalyticsCollectionEnabled() async {
    await analytics.setAnalyticsCollectionEnabled(false);
    await analytics.setAnalyticsCollectionEnabled(true);
    setMessage('setAnalyticsCollectionEnabled succeeded');
  }

  Future<void> _testSetSessionTimeoutDuration() async {
    await analytics.android?.setSessionTimeoutDuration(2000000);
    setMessage('setSessionTimeoutDuration succeeded');
  }

  Future<void> _testSetUserProperty() async {
    await analytics.setUserProperty(name: 'favorite_color', value: 'red');
    setMessage('setUserProperty succeeded');
  }

  Future<void> _testAllEventTypes() async {
    await analytics.logAddPaymentInfo();
    await analytics.logAddToCart(
      currency: 'USD',
      value: 123.0,
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      origin: 'test origin',
      itemLocationId: 'test location id',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
    );
    await analytics.logAddToWishlist(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      value: 123.0,
      currency: 'USD',
      itemLocationId: 'test location id',
    );
    await analytics.logAppOpen();
    await analytics.logBeginCheckout(
      value: 123.0,
      currency: 'USD',
      transactionId: 'test tx id',
      numberOfNights: 2,
      numberOfRooms: 3,
      numberOfPassengers: 4,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
      travelClass: 'test travel class',
    );
    await analytics.logCampaignDetails(
      source: 'test source',
      medium: 'test medium',
      campaign: 'test campaign',
      term: 'test term',
      content: 'test content',
      aclid: 'test aclid',
      cp1: 'test cp1',
    );
    await analytics.logEarnVirtualCurrency(
      virtualCurrencyName: 'bitcoin',
      value: 345.66,
    );
    await analytics.logEcommercePurchase(
      currency: 'USD',
      value: 432.45,
      transactionId: 'test tx id',
      tax: 3.45,
      shipping: 5.67,
      coupon: 'test coupon',
      location: 'test location',
      numberOfNights: 3,
      numberOfRooms: 4,
      numberOfPassengers: 5,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-13',
      endDate: '2015-09-14',
      travelClass: 'test travel class',
    );
    await analytics.logGenerateLead(
      currency: 'USD',
      value: 123.45,
    );
    await analytics.logJoinGroup(
      groupId: 'test group id',
    );
    await analytics.logLevelUp(
      level: 5,
      character: 'witch doctor',
    );
    await analytics.logLogin();
    await analytics.logPostScore(
      score: 1000000,
      level: 70,
      character: 'tiefling cleric',
    );
    await analytics.logPresentOffer(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 6,
      price: 3.45,
      value: 67.8,
      currency: 'USD',
      itemLocationId: 'test item location id',
    );
    await analytics.logPurchaseRefund(
      currency: 'USD',
      value: 45.67,
      transactionId: 'test tx id',
    );
    await analytics.logSearch(
      searchTerm: 'hotel',
      numberOfNights: 2,
      numberOfRooms: 1,
      numberOfPassengers: 3,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-16',
      travelClass: 'test travel class',
    );
    await analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await analytics.logShare(
        contentType: 'test content type',
        itemId: 'test item id',
        method: 'facebook');
    await analytics.logSignUp(
      signUpMethod: 'test sign up method',
    );
    await analytics.logSpendVirtualCurrency(
      itemName: 'test item name',
      virtualCurrencyName: 'bitcoin',
      value: 34,
    );
    await analytics.logTutorialBegin();
    await analytics.logTutorialComplete();
    await analytics.logUnlockAchievement(id: 'all Firebase API covered');
    await analytics.logViewItem(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      itemLocationId: 'test item location id',
      price: 3.45,
      quantity: 6,
      currency: 'USD',
      value: 67.8,
      flightNumber: 'test flight number',
      numberOfPassengers: 3,
      numberOfRooms: 1,
      numberOfNights: 2,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-15',
      searchTerm: 'test search term',
      travelClass: 'test travel class',
    );
    await analytics.logViewItemList(
      itemCategory: 'test item category',
    );
    await analytics.logViewSearchResults(
      searchTerm: 'test search term',
    );
    setMessage('All standard events logged successfully');
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

  Future<void> _testEventTypesView() async {
    await analytics.logViewItem(
        itemId: '1', itemName: 'baju', itemCategory: 'pakaian');
    setMessage('view item success');
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

  Future<void> _scenario1() async {
    await analytics.logLogin();
    await analytics.setUserId("0001");
    await analytics.setUserProperty(name: 'favorite_color', value: 'red');
    setMessage('Scnario 1 success');
  }

  Future<void> _scenario2() async {
    await analytics.logLogin();
    await analytics.setUserId("0002");
    await analytics.setUserProperty(name: 'favorite_color', value: 'blue');
    await analytics.logSearch(searchTerm: 'buku');
    setMessage('Scnario 2 success');
  }

  Future<void> _scenario3() async {
    await analytics.logLogin();
    await analytics.setUserId("0003");
    await analytics.setUserProperty(name: 'favorite_color', value: 'black');
    await analytics.logSearch(searchTerm: 'buku');
    await analytics.logSelectContent(contentType: 'novel', itemId: '1234');
    setMessage('Scnario 3 success');
  }

  Future<void> _scenario4() async {
    await analytics.logLogin();
    await analytics.setUserId("0004");
    await analytics.setUserProperty(name: 'favorite_color', value: 'pink');
    await analytics.logSearch(searchTerm: 'buku');
    await analytics.logSelectContent(contentType: 'novel', itemId: '1234');
    await analytics.logAddToCart(
        itemId: '123', itemName: 'novel 1', itemCategory: 'novel', quantity: 2);
    setMessage('Scnario 4 success');
  }

  Future<void> _scenario5() async {
    await analytics.logLogin();
    await analytics.setUserId("0005");
    await analytics.setUserProperty(name: 'favorite_color', value: 'blue');
    await analytics.logSearch(searchTerm: 'laptop');
    await analytics.logSelectContent(contentType: 'laptop', itemId: '12365');
    await analytics.logAddToCart(
        itemId: '012',
        itemName: 'laptop asus',
        itemCategory: 'elektronik',
        quantity: 1);
    await analytics.logEcommercePurchase(
        currency: 'IDR', value: 8000000, transactionId: '1234');
    setMessage('Scnario 5 success');
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
                color: Colors.grey,
                child: const Text('Test logEvent'),
                onPressed: _sendAnalyticsEvent,
              ),
              // MaterialButton(
              //   color: Colors.green,
              //   child: const Text('Test standard event types'),
              //   onPressed: _testAllEventTypes,
              // ),
              // MaterialButton(
              //   color: Colors.red,
              //   child: const Text('Test setUserId'),
              //   onPressed: _testSetUserId,
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   child: const Text('Test setCurrentScreen'),
              //   onPressed: _testSetCurrentScreen,
              // ),
              // MaterialButton(
              //   color: Colors.red,
              //   child: const Text('Test setAnalyticsCollectionEnabled'),
              //   onPressed: _testSetAnalyticsCollectionEnabled,
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   child: const Text('Test setSessionTimeoutDuration'),
              //   onPressed: _testSetSessionTimeoutDuration,
              // ),
              // MaterialButton(
              //   color: Colors.red,
              //   child: const Text('Test setUserProperty'),
              //   onPressed: _testSetUserProperty,
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   child: const Text('Test logEvent'),
              //   onPressed: _sendAnalyticsEvent,
              // ),
              // MaterialButton(
              //   color: Colors.red,
              //   child: const Text('Test Coba'),
              //   onPressed: _testLogEvent,
              // ),
              // MaterialButton(
              //   color: Colors.green,
              //   child: const Text('Test view item'),
              //   onPressed: _testEventTypesView,
              // ),
              MaterialButton(
                color: Colors.green,
                child: const Text('Login'),
                onPressed: _login,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Search item'),
                onPressed: _search,
              ),
              MaterialButton(
                color: Colors.green,
                child: const Text('Set User Property'),
                onPressed: _setUserProperty,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Set UserId'),
                onPressed: _setUserId,
              ),
              MaterialButton(
                color: Colors.green,
                child: const Text('Select Content'),
                onPressed: _selectContent,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Add To Chart'),
                onPressed: _addToChart,
              ),
              MaterialButton(
                color: Colors.green,
                child: const Text('Add Payment Info'),
                onPressed: _addPaymentInfo,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Purchase'),
                onPressed: _purchaseItem,
              ),
              MaterialButton(
                color: Colors.blue,
                child: const Text('Skenario 1'),
                onPressed: _scenario1,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Skenario 2'),
                onPressed: _scenario2,
              ),
              MaterialButton(
                color: Colors.blue,
                child: const Text('Skenario 3'),
                onPressed: _scenario3,
              ),
              MaterialButton(
                color: Colors.red,
                child: const Text('Skenario 4'),
                onPressed: _scenario4,
              ),
              MaterialButton(
                color: Colors.blue,
                child: const Text('Skenario 5'),
                onPressed: _scenario5,
              ),
              Text(_message,
                  style:
                      const TextStyle(color: Color.fromARGB(255, 0, 155, 0))),
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
