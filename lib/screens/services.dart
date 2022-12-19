import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_service/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/details.dart';

class ServicePage extends StatefulWidget {
  final String cat;
  final User user;

  const ServicePage({required this.cat, required this.user});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),

        title: Text(
          'All Services',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: person.length,
          itemBuilder: (context, i) {
            return (widget.cat == person[i]['category'])
                ? SizedBox(
                    width: w,
                    height: h / 5,
                    child: GestureDetector(
                      onTap: () {
                        print(widget.cat);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>  BuyPage()),
                        // );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    cat: person[i]['service'],
                                    user: widget.user,
                                  )),
                        );
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        color: Colors.grey.shade200,
                        child: Row(
                          children: [
                            SizedBox(
                              width: w / 2.4,
                              height: h,
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Image.asset(
                                    person[i]['image'],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    person[i]['name'],
                                    style: GoogleFonts.comfortaa(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Category : ${person[i]['category']}',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Service : ${person[i]['service']}',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Experience : ${person[i]['exp']}',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Price : ${person[i]['hr']}',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    'Rating : ${person[i]['rate']}',
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container();
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
