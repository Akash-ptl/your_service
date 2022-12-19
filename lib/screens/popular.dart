import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_service/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/buy.dart';

class PopularPage extends StatefulWidget {
  final User user;

  const PopularPage({required this.user});

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
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
        title: Text(
          'Popular',
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
          itemCount: service.length,
          itemBuilder: (context, i) {
            return SizedBox(
              width: w,
              height: h / 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuyPage(
                              user: widget.user, ind: i,
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
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Image.asset(service[i]['img']),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service[i]['name'],
                              style: GoogleFonts.comfortaa(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Category : ${service[i]['category']}',
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Service : ${service[i]['service']}',
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Experience : ${service[i]['exp']}',
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Price : ${service[i]['hr']}',
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Rating : ${service[i]['rate']}',
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
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
