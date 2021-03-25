import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_password_strength/flutter_password_strength.dart';

class PasswordStrengthCheck extends StatefulWidget {
  @override
  _PasswordStrengthCheckState createState() => _PasswordStrengthCheckState();
}

class _PasswordStrengthCheckState extends State<PasswordStrengthCheck> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _password;
  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();
  _validateInputs(){
    if(_formKey.currentState.validate()){
      return _formKey.currentState.save();
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("password Strength"),
      backgroundColor: Colors.blue[800],
    ),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child:Column(
         children: [
           Container(
               child:Form(
                 key: _formKey,
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Text("Email"),
                     TextFormField(
                       controller: _emailController,
                       decoration: InputDecoration(
                         //labelText: "Email"
                       ),
                       onSaved: (String value) {
                       },
                       validator: (value){

                         _password=value;
                         if(value.isEmpty){
                           return "Required Field";
                         }
                         else{
                           return null;
                         }
                       },
                     ),
                     SizedBox(height: 20,),
                     Text("Password"),
                     TextFormField(
                       obscureText: true,
                       controller:_passwordController,
                       decoration: InputDecoration(
                         //labelText: "Email"
                       ),
                      onChanged: (value) {
                         setState(() {
                           _password = value;
                         });
                       },
                       onSaved: (value) {
                         setState(() {
                           _password = value;
                         });
                       },
                       validator: (value){

                         _password=value;
                         if(value.isEmpty){
                           return "Required Field";
                         }
                         else{
                           return null;
                         }
                       },
                     ),
                     SizedBox(height: 10,),
                     FlutterPasswordStrength(
                         backgroundColor: Colors.grey[300],
                         password: _password,
                         strengthCallback: (strength){
                         debugPrint(strength.toString());

                         }
                     ),
                     SizedBox(height: 20,),
                     Text("Confirm Password"),

                     TextFormField(
                       controller: _confirmPasswordController,
                       decoration: InputDecoration(
                         //labelText: "Email"
                       ),
                       onSaved: (String value) {
                       },
                       validator: (value){
                         if(value.isEmpty){
                           return "Required Field";
                         }
                         else{
                           return null;
                         }
                       },
                     ),
                   ],
                 ),
               )
           ),
          SizedBox(height: 20,),
          Center(
            child: RaisedButton(
              color: Colors.blue[800],
              onPressed:(){
                _validateInputs();
              },
              child: Text("Submit",style: TextStyle(color: Colors.white),),
            ),
          )
         ],
       )
     ),
    );
  }
}
