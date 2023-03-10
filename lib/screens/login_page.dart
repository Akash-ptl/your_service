import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/home.dart';
import 'package:your_service/screens/register_page.dart';
import 'package:your_service/screens/reset.dart';
import 'package:your_service/utils/fire_auth.dart';
import 'package:your_service/utils/validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late Future _future;

  @override
  void initState() {
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
            cat: '',
          ),
        ),
      );
    }

    return firebaseApp;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    cat: '',
                    user: user!,
                  )));
// if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
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

                                              if (user != null) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(
                                                      user: user,
                                                      cat: '',
                                                    ),
                                                  ),
                                                );
                                              }
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
                            GestureDetector(
                              onTap: () async {
                                signup(context);
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
