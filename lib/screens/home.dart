import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:your_service/admin/add.dart';
import 'package:your_service/admin/edit.dart';
import 'package:your_service/admin/list.dart';
import 'package:your_service/global.dart';
import 'package:your_service/screens/aboutus.dart';
import 'package:your_service/screens/category.dart';
import 'package:your_service/screens/cleaning.dart';
import 'package:your_service/screens/contact.dart';
import 'package:your_service/screens/details.dart';
import 'package:your_service/screens/login_page.dart';
import 'package:your_service/screens/order.dart';
import 'package:your_service/screens/review.dart';
import 'package:your_service/services/crud.dart';

class HomePage extends StatefulWidget {
  final User user;
  final String cat;

  const HomePage({super.key, required this.user, required this.cat});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  int index = 0;
  final Stream<QuerySnapshot> collection = FirebaseCrud.readWorker();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Your Service',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IndexedStack(index: index, children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 12),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/crsl1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/crsl2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/crsl3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/crsl4.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("images/crsl5.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.comfortaa(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(
                            user: widget.user,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.comfortaa(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder(
                    stream: collection,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return (index < 3)
                                  ? SizedBox(
                                      width: 180,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CleaningPage(
                                                      user: widget.user,
                                                      cat: snapshot
                                                              .data!.docs[index]
                                                          ['Category'],
                                                    )),
                                          );
                                        },
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                          color: Colors.grey.shade200,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: w,
                                                height: 162,
                                                child: Card(
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                12)),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 100,
                                                        width: 100,
                                                        child: Image.network(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['Image'],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                snapshot.data!.docs[index]
                                                    ['Category'],
                                                style: GoogleFonts.comfortaa(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container();
                            });
                      }
                      return Container();
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular Workers',
                  style: GoogleFonts.comfortaa(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: h / 3.1,
                child: StreamBuilder(
                    stream: collection,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 386,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                              cat: snapshot.data!.docs[index]
                                                  ['Category'],
                                              user: widget.user,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: w,
                                        height: h / 6,
                                        child: const Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                          ),
                                          // child: Image.asset(
                                          //     service[index]['img']),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: h / 8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data!.docs[index]
                                                    ['Name'],
                                                style: GoogleFonts.comfortaa(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    }),
              )
            ],
          ),
        ),
        Container(),
        Container(),
        (widget.user.uid == 'CrAHdUiziNRPPvwiKTmEj2EGIOK2')
            ? Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Center(
                            child: Stack(
                              alignment: const Alignment(1, 0.9),
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade300,
                                  radius: 42,
                                  child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(CupertinoIcons.add_circled_solid,
                                      size: 30, color: blackColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_currentUser.displayName}',
                                style: GoogleFonts.comfortaa(
                                  color: blackColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${_currentUser.email}',
                                style: GoogleFonts.comfortaa(
                                  color: greyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: Text(' Add  ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: Text(' Edit ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(' List ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on),
                        title: Text(' Add Category ',
                            style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text('LogOut', style: GoogleFonts.comfortaa()),
                        onTap: () async {
                          setState(() {});
                          await FirebaseAuth.instance.signOut();
                          setState(() {});

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Center(
                            child: Stack(
                              alignment: const Alignment(1, 0.9),
                              children: [
                                const CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(CupertinoIcons.add_circled_solid,
                                      size: 30, color: blackColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_currentUser.displayName}',
                                style: GoogleFonts.comfortaa(
                                  color: blackColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${_currentUser.email}',
                                style: GoogleFonts.comfortaa(
                                  color: greyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ListTile(
                        leading: const Icon(Icons.book),
                        title:
                            Text(' My Order ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrderPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.workspace_premium),
                        title: Text(' Change Password ',
                            style: GoogleFonts.comfortaa()),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on),
                        title: Text(' Your Address ',
                            style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.video_label),
                        title: Text(' Contact Us ',
                            style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ContactPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: Text(' Help ', style: GoogleFonts.comfortaa()),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: Text(' Review ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReviewPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title:
                            Text(' About us ', style: GoogleFonts.comfortaa()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutusPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: Text('LogOut', style: GoogleFonts.comfortaa()),
                        onTap: () async {
                          setState(() {});
                          await FirebaseAuth.instance.signOut();
                          setState(() {});

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ]),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        iconSize: 30,
        elevation: 5,
        currentIndex: index,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: GoogleFonts.comfortaa(),
        selectedLabelStyle: GoogleFonts.comfortaa(),
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset('images/YS.png', height: 25), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
          BottomNavigationBarItem(
            icon: const Icon(MdiIcons.accountOutline),
            label: (widget.user.uid == 'CrAHdUiziNRPPvwiKTmEj2EGIOK2')
                ? 'Admin'
                : 'Account',
          )
        ],
      ),
    );
  }
}
