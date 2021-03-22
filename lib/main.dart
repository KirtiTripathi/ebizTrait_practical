import 'package:ebiz_trait_test_flutter_app/job_list.dart';
import 'package:ebiz_trait_test_flutter_app/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => RegisterPage(),
        '/JobListPage': (BuildContext context) => JobList(),
        //home: RegisterPage(),
      }));
}


