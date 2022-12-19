import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/admin.dart';
import 'package:your_service/screens/home.dart';
import 'package:your_service/screens/register_page.dart';
import 'package:your_service/screens/reset.dart';
import 'package:your_service/utils/fire_auth.dart';
import 'package:your_service/utils/validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late GoogleSignIn _googleSignIn;
  late Future _future;

  @override
  void initState() {
    // _checkIfisLoggedIn();
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    super.initState();
    _future = _initializeFirebase();
  }

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Welcome back!',
                            style: GoogleFonts.comfortaa(
                                fontSize: 38, fontWeight: FontWeight.w900)),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sign in to Continue',
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const Spacer(),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailTextController,
                              focusNode: _focusEmail,
                              validator: (value) => Validator.validateEmail(
                                email: value,
                              ),
                              style: GoogleFonts.comfortaa(),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: GoogleFonts.comfortaa(),
                                errorStyle: GoogleFonts.comfortaa(),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TextFormField(
                              controller: _passwordTextController,
                              focusNode: _focusPassword,
                              obscureText: true,
                              validator: (value) => Validator.validatePassword(
                                password: value,
                              ),
                              style: GoogleFonts.comfortaa(),
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: GoogleFonts.comfortaa(),
                                errorStyle: GoogleFonts.comfortaa(),
                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ResetPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: GoogleFonts.comfortaa(fontSize: 14),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            _isProcessing
                                ? const CircularProgressIndicator()
                                : Column(
                                    children: [
                                      SizedBox(
                                        height: h / 20,
                                        width: w,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            _focusEmail.unfocus();
                                            _focusPassword.unfocus();

                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isProcessing = true;
                                              });

                                              User? user = await FireAuth
                                                  .signInUsingEmailPassword(
                                                email:
                                                    _emailTextController.text,
                                                password:
                                                    _passwordTextController
                                                        .text,
                                              );

                                              setState(() {
                                                _isProcessing = false;
                                              });

                                              if (user!.uid ==
                                                  'CrAHdUiziNRPPvwiKTmEj2EGIOK2') {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AdminPage(),
                                                  ),
                                                );
                                              } else if (user!=null) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(user: user),
                                                  ),
                                                );
                                              }

                                              // if (user != null) {
                                              //   Navigator.of(context)
                                              //       .pushReplacement(
                                              //     MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           HomePage(user: user),
                                              //     ),
                                              //   );
                                              // }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black),
                                          child: Text(
                                            'Sign In',
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      Text(
                                        'or login with',
                                        style: GoogleFonts.comfortaa(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    GoogleSignInAccount? googleSignInAccount =
                                        await _googleSignIn.signIn();
                                    if (googleSignInAccount != null) {
                                      print(googleSignInAccount.displayName);
                                      print(googleSignInAccount.email);
                                      print(googleSignInAccount.id);
                                    }
                                    User? user =
                                        await FireAuth.signInUsingEmailPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text,
                                    );
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(user: user),
                                        ),
                                      );
                                    }
                                  },
                                  child: const CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 21.2,
                                      backgroundImage:
                                          AssetImage('images/google.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    _login();
                                  },
                                  child: const CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.grey,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 21.2,
                                      backgroundImage:
                                          AssetImage('images/facebook.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: GoogleFonts.comfortaa(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              'SIGN UP',
                              style: GoogleFonts.comfortaa(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      )
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              case ConnectionState.active:
                break;
              case ConnectionState.none:
                break;
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
