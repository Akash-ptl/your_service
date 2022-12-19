import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:your_service/global.dart';
import 'package:your_service/screens/aboutus.dart';
import 'package:your_service/screens/category.dart';
import 'package:your_service/screens/cleaning.dart';
import 'package:your_service/screens/contact.dart';
import 'package:your_service/screens/login_page.dart';
import 'package:your_service/screens/order.dart';
import 'package:your_service/screens/popular.dart';
import 'package:your_service/screens/review.dart';
import 'package:your_service/screens/services.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({
    super.key,
    required this.user,
  });

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
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
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
          padding: const EdgeInsets.only(right: 24.0, left: 12.0),
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
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.comfortaa(
                        fontSize: 20.0, fontWeight: FontWeight.w900),
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
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: h / 4.7,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return (index < 3)
                          ? SizedBox(
                              width: 180.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CleaningPage(
                                              user: widget.user,
                                              cat: category[index]['name'],
                                            )),
                                  );
                                  print(category[index]['cayegory']);
                                },
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                  ),
                                  color: Colors.grey.shade200,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: w,
                                        height: 162.0,
                                        child: Card(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 100.0,
                                                width: 100.0,
                                                child: Image.network(
                                                  category[index]['img'],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        category[index]['name'],
                                        style: GoogleFonts.comfortaa(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Services',
                    style: GoogleFonts.comfortaa(
                        fontSize: 20.0, fontWeight: FontWeight.w900),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PopularPage(user: widget.user)),
                      );
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.comfortaa(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: h / 3.1,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: service.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 386.0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ServicePage(
                                        cat: service[index]['category'],
                                        user: widget.user,
                                      )),
                            );
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            color: Colors.grey.shade200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: w,
                                  height: 162.0,
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0)),
                                    ),
                                    child: Image.asset(service[index]['img']),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 110.0,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          service[index]['name'],
                                          style: GoogleFonts.comfortaa(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rating : ${service[index]['rate']}',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          'Category : ${service[index]['category']}',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          'Service : ${service[index]['service']}',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          'Experience : ${service[index]['exp']}',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        Text(
                                          'Price : ${service[index]['hr']}',
                                          style: GoogleFonts.comfortaa(
                                            fontSize: 14.0,
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
              ),
            ],
          ),
        ),
        Container(),
        Container(),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: Stack(
                      alignment: const Alignment(1, 0.9),
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(CupertinoIcons.add_circled_solid,
                              size: 30.0, color: blackColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_currentUser.displayName}',
                        style: GoogleFonts.comfortaa(
                          color: blackColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '${_currentUser.email}',
                        style: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ListTile(
                leading: const Icon(Icons.book),
                title: Text(' My Order ', style: GoogleFonts.comfortaa()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrderPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title:
                    Text(' Change Password ', style: GoogleFonts.comfortaa()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(' Your Address ', style: GoogleFonts.comfortaa()),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: Text(' Contact Us ', style: GoogleFonts.comfortaa()),
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
                    MaterialPageRoute(builder: (context) => const ReviewPage()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(' About us ', style: GoogleFonts.comfortaa()),
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
      ]),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        iconSize: 30.0,
        elevation: 5.0,
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
              icon: (index == 0)
                  ? Image.asset('images/YS.png', height: 25.0)
                  : Image.asset('images/ysgrey.png', height: 25.0),
              label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'History'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
          const BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountOutline),
            label: 'Account',
          )
        ],
      ),
    );
  }
}
