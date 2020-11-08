import 'package:flutter/material.dart';
import 'package:ideathon/pages/dashboard.dart';
import 'package:ideathon/pages/info_detail.dart';
import 'package:ideathon/pages/service-customer.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'info-detail',
      routes: {
        'dashboard':(BuildContext context) => Dashboard(),
        'info-detail': (BuildContext conttext) => InfoDetail(),
        'customer': (BuildContext conttext) => ServiceCustomer()
      },
    );
  }
}