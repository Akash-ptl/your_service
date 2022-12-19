import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:your_service/screens/buy.dart';

class DetailPage extends StatefulWidget {
  final String cat;
  final User user;

  const DetailPage({required this.cat, required this.user});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
          'Details',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: person.length,
        itemBuilder: (context, i) {
          return (widget.cat == person[i]['service'])
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: 250,
                            width: width,
                            child: Image.asset(person[i]['image']),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          person[i]['name'],
                          style: GoogleFonts.comfortaa(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          person[i]['service'],
                          style: GoogleFonts.comfortaa(
                            fontSize: 16,
                            color: greyColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                color: Colors.grey.shade200,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  elevation: 0,
                                  child: Container(
                                    height: 60,
                                    width: width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      person[i]['exp'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Card(
                                color: Colors.grey.shade200,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  elevation: 0,
                                  child: Container(
                                    height: 60,
                                    width: width,
                                    alignment: Alignment.center,
                                    child: Text(
                                      person[i]['rate'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "About",
                          style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim,",
                          style: GoogleFonts.comfortaa(
                            fontSize: 14,
                            color: greyColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                          height: height / 20,
                          width: width,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BuyPage(
                                          user: widget.user,
                                          ind: i,
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                            child: Text(
                              'Buy now',
                              style: GoogleFonts.comfortaa(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
