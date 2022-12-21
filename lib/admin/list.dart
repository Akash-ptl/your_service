import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/admin/edit.dart';
import 'package:your_service/models/workers.dart';
import 'package:your_service/services/crud.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPage();
  }
}

class _ListPage extends State<ListPage> {
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readWorker();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'List',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: collectionReference,
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditPage()),
                          );
                        },
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
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['Category'],
                                              style: GoogleFonts.comfortaa(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                              'Experience : ${snapshot.data!.docs[index]['Experience']}',
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
                                            Text(
                                              'Rating : ${snapshot.data!.docs[index]['Rating']}',
                                              style: GoogleFonts.comfortaa(
                                                fontSize: 14,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        const Color.fromARGB(
                                                            255, 143, 133, 226),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    textStyle: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  child: Text(
                                                    'Edit',
                                                    style:
                                                        GoogleFonts.comfortaa(
                                                            color:
                                                                Colors.green),
                                                  ),
                                                  onPressed: () {
                                                    Navigator
                                                        .pushAndRemoveUntil<
                                                            dynamic>(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            EditPage(
                                                          worker: Workers(
                                                              uid: snapshot
                                                                  .data!
                                                                  .docs[index]
                                                                  .id,
                                                              name: snapshot.data!.docs[index]
                                                                  ['Name'],
                                                              category: snapshot
                                                                      .data!
                                                                      .docs[index]
                                                                  ['Category'],
                                                              image: snapshot.data!.docs[index]
                                                                  ['Image'],
                                                              rating: snapshot
                                                                      .data!
                                                                      .docs[index]
                                                                  ['Rating'],
                                                              service: snapshot
                                                                      .data!
                                                                      .docs[index]
                                                                  ['Service'],
                                                              experience: snapshot
                                                                  .data!
                                                                  .docs[index]['Experience'],
                                                              time: snapshot.data!.docs[index]['Time'],
                                                              details: snapshot.data!.docs[index]['Details'],
                                                              price: snapshot.data!.docs[index]['Price']),
                                                        ),
                                                      ),
                                                      (route) =>
                                                          true, //if you want to disable back feature set to false
                                                    );
                                                  },
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        const Color.fromARGB(
                                                            255, 143, 133, 226),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    textStyle: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  child: Text('Delete',
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                              color:
                                                                  Colors.red)),
                                                  onPressed: () async {
                                                    var response =
                                                        await FirebaseCrud
                                                            .deleteWorker(
                                                                docId: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                    .id);
                                                    if (response.code != 200) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  response
                                                                      .message
                                                                      .toString()),
                                                            );
                                                          });
                                                    }
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }

          return Container();
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
