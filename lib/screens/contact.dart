import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage();

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
  }

  _callNumber() async {
    const number = '08592119XXXX';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Contact us',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: w,
              height: h / 10,
              child: GestureDetector(
                onTap: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'akashkalathiya46@gmail.com',
                  );

                  launchUrl(emailLaunchUri);
                },
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  color: Colors.grey.shade200,
                  child: Row(
                    children: [
                      SizedBox(
                        width: w / 4.2,
                        height: h / 10,
                        child: Card(
                          margin: const EdgeInsets.all(6),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.network(
                                      'https://img.icons8.com/ultraviolet/512/new-post.png')),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('akashkalathiya46@gmail.com',
                          style: GoogleFonts.comfortaa(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: w,
              height: h / 10,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                color: Colors.grey.shade200,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _callNumber();
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: w / 4.2,
                        height: h / 10,
                        child: Card(
                          margin: const EdgeInsets.all(6),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  'https://img.icons8.com/ultraviolet/512/phone.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text('+91 6756243665',
                          style: GoogleFonts.comfortaa(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
