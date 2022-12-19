import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:your_service/screens/services.dart';

class CategoryPage extends StatefulWidget {
  final User user;

  const CategoryPage({required this.user});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
          'All Category',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridView.count(
        childAspectRatio: 2 / 2.4,
        crossAxisCount: 2,
        children: List<Widget>.generate(
          category.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicePage(
                              cat: category[index]['name'],
                              user: widget.user,
                            )),
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  category[index]['img'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            category[index]['name'],
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Card(
                          margin: const EdgeInsets.only(right: 10),
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          child: SizedBox(
                            width: 55,
                            height: 32,
                            child: Center(
                                child: Text(
                              'Get',
                              style: GoogleFonts.comfortaa(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
