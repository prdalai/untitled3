import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobilenoController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void login(String name, username, emailid , password, mobileno) async {

    try{
      Response response = await post(
          Uri.parse('http://dwmsalsa.com/api.php'),
          body: {
            'name' : name,
            'username' : username,
            'password' : password,
            'mobileno' : mobileno,
            'emailid' : emailid
          }
      );

      if(response.statusCode == 200){
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: 'Name'
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Username'
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: mobilenoController,
                decoration: InputDecoration(
                    hintText: 'Mobileno'
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: emailidController,
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
              ),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  login(nameController.text.toString(),usernameController.text.toString(),mobilenoController.text.toString(),emailidController.text.toString(), passwordController.text.toString());

                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('Login'),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
