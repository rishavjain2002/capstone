import 'package:cap_1/service/http_Service.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String username = '';

  String email = '';

  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Login Screen'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'username'),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'email'),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
              ),
              InkWell(
                onTap: () async {
                  print('Register button pressed');
                  print('Username: $username, Password: $pass');
                  await HttpService.register(username, email, pass, context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                      child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            ],
          ),
        ));
  }
}
