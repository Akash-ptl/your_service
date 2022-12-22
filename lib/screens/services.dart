import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/details.dart';
import 'package:your_service/services/crud.dart';
import 'package:auto_size_text/auto_size_text.dart';

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

  final Stream<QuerySnapshot> collection = FirebaseCrud.readWorker();

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
                              height: 160,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              user: widget.user,
                                              cat: snapshot.data!.docs[index]
                                                  ['Service'],
                                            )),
                                  );
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                  ),
                                  color: Colors.grey.shade200,
                                  child: Row(
                                    children: [
                                      Card(
                                        elevation: 0,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: SizedBox(
                                          width: w / 3,
                                          child: Center(
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.asset(
                                                snapshot.data!.docs[index]
                                                    ['WImage'],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]['Name'],
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Category : ${snapshot.data!.docs[index]['Category']}',
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          AutoSizeText(
                                            'Service : ${snapshot.data!.docs[index]['Service']}',
                                            maxLines: 2,
                                            style: GoogleFonts.comfortaa(
                                                // fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Rating : ${snapshot.data!.docs[index]['Rating']}',
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Experience : ${snapshot.data!.docs[index]['Experience']}',
                                            style: GoogleFonts.comfortaa(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
