# Firebase Analytics for Flutter Application

This project integrate flutter with firebase for mobile apps analytic

Google Analytics is a free app measurement solution that provides insight on app usage and user engagement.
Analytics reports help you understand clearly how your users behave, which enables you to make informed decisions regarding app marketing and performance optimizations.

Google Analytics collects usage and behavior data for your app. The SDK logs two primary types of information:
- Events: What is happening in your app, such as user actions, system events, or errors.
- User properties: Attributes you define to describe segments of your user base, such as language preference or geographic location.

## How to add Firebase Analytics to your Flutter App:

## Step 1: Create a Firebase project 
https://console.firebase.google.com/

## Step 2: Register your app with Firebase
- In the center of the Firebase console's project overview page, click the Android icon to launch the setup workflow
- Enter your app's package name in the Android package name field

## Step 3: Add a Firebase configuration file
- Download google-services.json, move to android/app directory of your Flutter app.
- Add the google-services plugin to your Gradle files
  In root level project (android/build.gradle)
    classpath 'com.google.gms:google-services:4.3.3'
  In app level (android/app/build.gradle)
    apply plugin: 'com.google.gms.google-services' 
- Run flutter packages get.

## Step 4: Add FlutterFire plugins
- From the root directory of your Flutter app, open your pubspec.yaml file.
```
	firebase_core: ^0.4.0+9
	firebase_analytics: ^5.0.2
```
## Usage
``` flutter
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();
FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

# Function that listen to Widget 
Future <void> _login() async {	
    await analytics.logLogin();
}


# In Widget 
MaterialButton(
   color: Colors.green,
   child: Text('Login'),
   onPressed: _login,
)

```

## Extra Tip
If you want to see the events in Firebase Console quickly and reliably while debugging, use DebugView.

To enable Analytics Debug mode on an Android device, execute the following command line:
```
adb shell setprop debug.firebase.analytics.app <package_name>
```
This behavior persists until you explicitly disable Debug mode by executing the following command line:
```
adb shell setprop debug.firebase.analytics.app .none.
```

## For More Documentation
Please visit [Firebase Analytics](https://firebase.google.com/docs/analytics)
