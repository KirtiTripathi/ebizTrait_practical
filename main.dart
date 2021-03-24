import 'package:ebiz_trait_test_flutter_app/job_list.dart';
import 'package:ebiz_trait_test_flutter_app/register_page.dart';
import 'package:ebiz_trait_test_flutter_app/shared_prefs.dart';
import 'package:flutter/material.dart';

void main() {
  var register = Prefs.getString("register");
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': register==false?(BuildContext context) => RegisterPage():(BuildContext context) => JobList(),
        '/JobListPage': (BuildContext context) => JobList(),
        //home: RegisterPage(),
      }));
}


