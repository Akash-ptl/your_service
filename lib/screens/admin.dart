import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/login_page.dart';

class AdminPage extends StatefulWidget {
  const AdminPage();

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool _isSigningOut = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Center(
        child: ListTile(
          leading: const Icon(Icons.logout),
          title: Text('LogOut', style: GoogleFonts.comfortaa()),
          onTap: () async {
            setState(() {
              _isSigningOut = true;
            });
            await FirebaseAuth.instance.signOut();
            setState(() {
              _isSigningOut = false;
            });
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
