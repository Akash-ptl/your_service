import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:your_service/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/screens/buy.dart';

import '../services/crud.dart';

class PopularPage extends StatefulWidget {
  final User user;
  final String cat;

  const PopularPage({required this.user, required this.cat});

  @override
  _PopularPageState createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
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
        title: Text(
          'Popular',
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
                                        builder: (context) => BuyPage(
                                              user: widget.user,
                                              i: index,
                                              list: snapshot.data!.docs,
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
                                                // child: Image.network(
                                                //   category[index]['img'],
                                                // ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        snapshot.data!.docs[index]['Category'],
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
