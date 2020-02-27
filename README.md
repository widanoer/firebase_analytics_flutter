# firebase_analytics_flutter

this project integrate flutter with firebase for mobile apps analytic

## Installation

Use  plugins as depedency in pubspec.yaml file.

bash
firebase_analytics
firebase_core


## Usage

flutter
import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics(); 
FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

# Function that listen to Widget 
Future<void> _login() async {
    await analytics.logLogin();
    setMessage('login success');
}

# In Widget 
MaterialButton(
   color: Colors.green,
   child: Text('Login'),
   onPressed: _login,
  )


## For Another Docummentation
Please visit [Firebase Analytics](https://firebase.google.com/docs/analytics)