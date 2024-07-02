import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class AppTheme {
  static const Color royalBlue = Color(0xFF091235);
  static const Color navyBlue = Color(0xFF14202E);
  static const Color midnightBlue = Color(0xFF2B4257);
  static const Color blueGray = Color(0xFF88A9C3);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: royalBlue,
    hintColor: blueGray,
    scaffoldBackgroundColor: navyBlue,
    appBarTheme: AppBarTheme(
      color: royalBlue,
      iconTheme: IconThemeData(color: blueGray),
      // textTheme: TextTheme(
      //   headline6: TextStyle(color: blueGray, fontSize: 20),
      // ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: blueGray),
      bodyText2: TextStyle(color: midnightBlue),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: blueGray,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: blueGray,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Show the dialog after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      _showDialog(context);
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Time\'s Up!'),
          content: Text('You will be redirected to the login screen.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pushNamed('/login'); // Navigate to login screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Wait for the dialog to appear in 3 seconds.'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Text('Welcome to the Login Screen!'),
      ),
    );
  }
}
