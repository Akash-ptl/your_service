import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage();

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
  }

  final reviewKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Review',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: reviewKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Service Rating",
                style: GoogleFonts.comfortaa(
                  letterSpacing: 2.2,
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: StarRating(
                size: 55,
                inactiveStarColor: black,
                activeStarColor: Colors.yellow,
                onChanged: (rate) {},
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Review Title",
                style: GoogleFonts.comfortaa(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter The Review Title";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.comfortaa(
                    color: black, fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Brief of Your Review Title",
                style: GoogleFonts.comfortaa(
                  color: black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter The Review Title";
                  }
                  return null;
                },
                maxLines: 5,
                decoration: InputDecoration(
                    hintMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: black),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10))),
                style: GoogleFonts.comfortaa(
                    color: black, fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: h / 20,
                width: w,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (reviewKey.currentState!.validate()) {}
                    });
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.comfortaa(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
