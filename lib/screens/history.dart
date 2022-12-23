import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/services/crud.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage();

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  final Stream<QuerySnapshot> collectionhistory = FirebaseCrud.readHistory();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: StreamBuilder(
        stream: collectionhistory,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 180,
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        color: Colors.grey.shade200,
                        child: Column(
                          children: [
                            SizedBox(
                              width: w,
                              height: 162,
                              child: Card(
                                elevation: 0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(
                                              snapshot.data!.docs[index]
                                                  ['Image'],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name : ${snapshot.data!.docs[index]['Name']}',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Category : ${snapshot.data!.docs[index]['Category']}',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Service : ${snapshot.data!.docs[index]['Service']}',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              'Price : ${snapshot.data!.docs[index]['Price']}',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }

          return Container();
        },
      ),
    );
  }
}
