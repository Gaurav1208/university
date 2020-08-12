import 'package:flutter/material.dart';
import 'package:sign_in_flutter/email_password.dart';

import 'first_screen.dart';
import 'sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext scaffoldContext;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: new Builder(builder: (BuildContext context) {
          scaffoldContext = context;
          return new Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Welcome to AIOC',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'UNIVERSITY',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Worlds first digital University for professionals!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 45.0),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(75.0),
                          child: Image.asset(
                            "assets/images/aioc.png",
                            height: 150.0,
                          )),
                      SizedBox(height: 45.0),
                      _signInButton(),
                      SizedBox(height: 16.0),
                      _signInWithEmailAndPasswordButton(),
                      SizedBox(height: 16.0),
                      _signUpWithEmailAndPasswordButton(),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          'By using our services you are accepted to our terms & conditions and usage policy',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Text(
                          'Read the terms & policy agreement here!',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.lightBlue,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }

  Widget _signInButton() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: RaisedButton(
              color: Colors.white,
              onPressed: () {
                signInWithGoogle().then((success) {
                  if (success)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstScreen();
                        },
                      ),
                    );
                  else
                    showInSnackBar("Login Failed!");
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/images/googleLogo.png"),
                        height: 22.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget _signInWithEmailAndPasswordButton() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: RaisedButton(
              color: Colors.orangeAccent,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return EmailPasswordScreen();
                    },
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
//                    SvgPicture.asset(
//                    "assets/email_icon.svg",
//                    semanticsLabel: 'Acme Logo'
//                ),
                    Image(
                        image: AssetImage("assets/email-login.jpg"),
                        height: 22.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Email and Password',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  Widget _signUpWithEmailAndPasswordButton() {
    return SizedBox(
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return EmailPasswordScreen();
                    },
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/email-login.jpg"),
                        height: 22.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Create account with your Email',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
