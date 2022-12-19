import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutusPage extends StatefulWidget {
  const AboutusPage();

  @override
  _AboutusPageState createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'About us',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              color: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  elevation: 0,
                  child: SizedBox(
                    height: height / 6.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Why Choose Us?',
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'There’s a good reason we’re regarded as the gold standard. Actually, make that several reasons: person-centered approach, dedication, experience and longevity.',
                            style: GoogleFonts.comfortaa(
                                fontSize: 18, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            Card(
              color: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  elevation: 0,
                  child: SizedBox(
                    height: height / 6.5,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Our Vision',
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Our vision is to be the leading provider of Home services.',
                            style: GoogleFonts.comfortaa(
                                fontSize: 18, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            const Spacer(),
            SizedBox(
              height: 35,
              width: 35,
              child: Image.asset('images/YS.png'),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
