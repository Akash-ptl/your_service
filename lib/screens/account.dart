import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:your_service/screens/contact.dart';
import 'package:your_service/screens/login_page.dart';
import 'package:your_service/screens/review.dart';

class AccountPage extends StatefulWidget {
  final User user;

  const AccountPage({
    required this.user,
  });

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _isSigningOut = false;
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;

    super.initState();
  }

  Widget profileInformation({required Icon icon, required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        // border: Border.all(
        //   color: CupertinoColors.systemGrey3,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.comfortaa(
              color: blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Icon(CupertinoIcons.forward, color: blackColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Profile', style: GoogleFonts.comfortaa(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Center(
                    child: Stack(
                      alignment: const Alignment(1, 0.9),
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(CupertinoIcons.add_circled_solid,
                              size: 30, color: blackColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_currentUser.displayName}',
                        style: GoogleFonts.comfortaa(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${_currentUser.email}',
                        style: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.book),
                title: Text(' My Order ', style: GoogleFonts.comfortaa()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title:
                    Text(' Change Password ', style: GoogleFonts.comfortaa()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(' Your Address ', style: GoogleFonts.comfortaa()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: Text(' Contact Us ', style: GoogleFonts.comfortaa()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(' Help ', style: GoogleFonts.comfortaa()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(' Review ', style: GoogleFonts.comfortaa()),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ReviewPage(),
                    ),
                  );
                },
              ),
              ListTile(
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
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
