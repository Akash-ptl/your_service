import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/services.dart';
import 'package:your_service/services/crud.dart';

class CleaningPage extends StatefulWidget {
  final User user;
  final String cat;

  const CleaningPage({required this.user, required this.cat});

  @override
  _CleaningPageState createState() => _CleaningPageState();
}

class _CleaningPageState extends State<CleaningPage> {
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
          'Cleaning',
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
                              snapshot.data!.docs[index]['Category'])
                          ? SizedBox(
                              width: 180,
                              height: 200,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ServicePage(
                                              user: widget.user,
                                              cat: snapshot.data!.docs[index]
                                                  ['Category'],
                                            )),
                                  );
                                },
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
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['Service'],
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
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
