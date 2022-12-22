import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/buy.dart';
import 'package:your_service/services/crud.dart';

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

  final Stream<QuerySnapshot> collection = FirebaseCrud.readWorker();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
      body: StreamBuilder(
          stream: collection,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return (widget.cat ==
                              snapshot.data!.docs[index]['Service'])
                          ? SizedBox(
                              width: 180,
                              height: h / 1.3,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                color: Colors.grey.shade200,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: w,
                                      height: 162,
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Image.asset(
                                          snapshot.data!.docs[index]['WImage'],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: h / 2.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                snapshot.data!.docs[index]
                                                    ['Name'],
                                                style: GoogleFonts.comfortaa(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Text(
                                              'Category : ${snapshot.data!.docs[index]['Category']}',
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Service : ${snapshot.data!.docs[index]['Service']}',
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price : ${snapshot.data!.docs[index]['Price']}',
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Rating : ${snapshot.data!.docs[index]['Rating']}',
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Experience : ${snapshot.data!.docs[index]['Experience']}',
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Details : ${snapshot.data!.docs[index]['Details']}',
                                              textAlign: TextAlign.justify,
                                              style: GoogleFonts.comfortaa(
                                                  height: 1.2,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BuyPage(
                                                            user: widget.user,
                                                            i: index,
                                                            list: snapshot
                                                                .data!.docs,
                                                          )),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.black),
                                              child: Text(
                                                'Buy',
                                                style: GoogleFonts.comfortaa(
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container();
                    }),
              );
            }
            return Container();
          }),
      backgroundColor: Colors.white,
    );
  }
}
