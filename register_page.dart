import 'package:ebiz_trait_test_flutter_app/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey =new GlobalKey<FormState>();
  final TextEditingController _emailController =new TextEditingController();
  final TextEditingController _passwordController =new TextEditingController();
  final TextEditingController _pincodeController =new TextEditingController();
 String _isRegister = "false";
  void _validateInputs() {
      if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.blue[800],
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email"),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          //labelText: "Email"
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Required Field";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      Text("Password"),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            //labelText: "Password"
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Required Field";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      Text("Pin code"),
                      TextFormField(
                        controller: _pincodeController,
                          keyboardType:TextInputType.number,
                        decoration: InputDecoration(
                            //labelText: "Pin code"
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return "Required Field";
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Center(
                          child: RaisedButton(
                            onPressed: (){
                              _validateInputs();
                              if(_emailController.text !=null &&_emailController.text.isNotEmpty && _passwordController.text !=null && _passwordController.text.isNotEmpty && _pincodeController.text!=null && _pincodeController.text.isNotEmpty){
                                _isRegister = "true";
                                Prefs.setString("register", _isRegister);
                                Navigator.pushReplacementNamed(context, '/JobListPage');
                              }else{
                                Fluttertoast.showToast(msg: "Please fill above details");
                              }
                            },
                            color: Colors.blue[800],
                            child: Text("Register",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
