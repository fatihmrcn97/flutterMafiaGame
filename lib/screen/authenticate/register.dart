import 'package:flutter/material.dart';
import 'package:mafia/services/auth.dart';
import 'package:mafia/shared/constants.dart';
import 'package:mafia/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
    bool loading = false;
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Look who is Gonna be Mafia"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text("Login"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration:textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) =>
                    val.length < 6 ? 'Enter password at least 6 chars' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result =
                        await _auth.registerWithEmailandPass(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'Please supply a valid email';
                        loading = false;
                      });
                    }
                  }
                },
                color: Colors.pink[400],
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
