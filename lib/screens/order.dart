import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';

class OrderPage extends StatefulWidget {
  const OrderPage();

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
          'My Order',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: addOrder.length,
        itemBuilder: (context, i) {
          return SizedBox(
            width: w,
            height: h / 10,
            child: GestureDetector(
              onTap: () {},
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 4,
                      height: h,
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Image.asset(addOrder[i]['img']),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addOrder[i]['cat'],
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            addOrder[i]['rate'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            addOrder[i]['val'],
                            style: GoogleFonts.comfortaa(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
