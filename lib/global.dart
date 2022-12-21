import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage();

  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

List<Map<String, dynamic>> category = [
  {
    'img': 'https://img.icons8.com/ultraviolet/512/housekeeping.png',
    'name': 'Cleaning',
  },
  {
    'img': 'https://img.icons8.com/ultraviolet/512/roller-brush.png',
    'name': 'Painting',
  },
  {
    'img': 'https://img.icons8.com/ultraviolet/512/drill.png',
    'name': 'Electrician',
  },
  {
    'img': 'https://img.icons8.com/ultraviolet/512/plumbing.png',
    'name': 'Plumber',
  },
  {
    'img': 'https://img.icons8.com/ultraviolet/512/jigsaw.png',
    'name': 'Carpenter',
  },
];
List<Map<String, dynamic>> addOrder = [];
// int index = 0;
List<Map<String, dynamic>> service = [
  {
    'name': 'Emma',
    'img': 'images/cleaner1.png',
    'exp': '1.2 Years',
    'rate': '⭐⭐⭐⭐ 4.4 (100)',
    'hr': '20',
    'category': 'Cleaning',
    'service': 'House Cleaning',
    'des': 'd',
  },
  {
    'name': 'Esther Howard',
    'img': 'images/worker1.png',
    'exp': '1.2 Years',
    'rate': '⭐⭐⭐ 3.9 (125)',
    'hr': '20',
    'category': 'Carpenter',
    'service': 'Furniture Repair',
    'des': 'd',
  },
  {
    'name': 'Ravi Kumar',
    'img': 'images/painter1.png',
    'exp': '1.2 Years',
    'rate': '⭐⭐⭐ 4.1 (200)',
    'hr': '20',
    'service': 'Wall Painting',
    'category': 'Painting',
    'des': 'd',
  },
  {
    'name': 'Brooklyn Simmons',
    'img': 'images/electrician2.png',
    'exp': '1.2 Years',
    'rate': '⭐⭐⭐ 4 (90)',
    'hr': '20',
    'service': 'AC Repairing',
    'category': 'Electrician',
    'des': 'd',
  },
];

DateTime today = DateTime.now();
DateTime selectDay = DateTime.now();
DateTime focusDay = DateTime.now();
List<Map<String, dynamic>> hour = [
  {
    'time': '9:00 AM to 10:30 AM',
    'clr': false,
    'slot': 0,
  },
  {
    'time': '11:00 AM to 12:30 PM',
    'clr': false,
    'slot': 1,
  },
  {
    'time': '2:00 PM to 3:30 PM',
    'clr': false,
    'slot': 2,
  },
  {
    'time': '4:00 PM to 5:30 PM',
    'clr': false,
    'slot': 3,
  },
  {
    'time': '6:00 PM to 7:30 PM',
    'clr': false,
    'slot': 4,
  },
];

List time = [
  '9:00 AM to 10:30 AM',
  '11:00 AM to 12:30 PM'
      '2:00 PM to 3:30 PM',
  '4:00 PM to 5:30 PM',
  '6:00 PM to 7:30 PM'
];
Color selectColor = Colors.red;

Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color greyColor = Colors.grey;
GlobalKey<FormState> buyNow = GlobalKey<FormState>();
GlobalKey<FormState> reviewKey = GlobalKey<FormState>();
List<Map<String, dynamic>> cleaning = [
  {
    'name': 'Aaron',
    'image': 'images/bathroom.png',
    'exp': '3 Years',
    'rate': '⭐ 3.9',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Washroom Clean',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Anisa',
    'image': 'images/sofa.png',
    'exp': '1.5 Years',
    'rate': '⭐ 4',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Sofa Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Dev',
    'image': 'images/kitchen.png',
    'exp': '1 Years',
    'rate': '⭐ 3.9',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Kitchen Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Olive Grater',
    'image': 'images/car.png',
    'exp': '8 month',
    'rate': '⭐ 3',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Car Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
];
String userName = "",
    userPhone = "",
    userAdd = "",
    userPinCode = "",
    userCity = "",
    userState = "",
    userCountry = "";

List<Map<String, dynamic>> person = [
  {
    'name': 'Emma',
    'image': 'images/cleaner1.png',
    'exp': '1.2 Years',
    'rate': '⭐ 4.4',
    'hr': '20',
    'category': 'Cleaning',
    'service': 'House Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Aaron',
    'image': 'images/bathroom.png',
    'exp': '3 Years',
    'rate': '⭐ 3.9',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Washroom Clean',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Anisa',
    'image': 'images/sofa.png',
    'exp': '1.5 Years',
    'rate': '⭐ 4',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Sofa Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Dev',
    'image': 'images/kitchen.png',
    'exp': '1 Years',
    'rate': '⭐ 3.9',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Kitchen Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Olive Grater',
    'image': 'images/car.png',
    'exp': '8 month',
    'rate': '⭐ 3',
    'hr': '30',
    'category': 'Cleaning',
    'service': 'Car Cleaning',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Ethan',
    'image': 'images/worker1.png',
    'exp': '4 Years',
    'rate': '⭐ 4.4',
    'hr': '28',
    'category': 'Carpenter',
    'service': 'Furniture Repair',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Ravi Kumar',
    'image': 'images/painter1.png',
    'exp': '1 Years',
    'rate': '⭐ 3.0',
    'hr': '15',
    'category': 'Painting',
    'service': 'WAll Painting',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Brooklyn Simmons',
    'image': 'images/electrician2.png',
    'exp': '2 Years',
    'rate': '⭐ 2.9',
    'hr': '25',
    'category': 'Electrician',
    'service': 'AC Repairing',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },
  {
    'name': 'Olive Grater',
    'image': 'images/plumber2.png',
    'exp': '3 Years',
    'rate': '⭐ 3.9',
    'hr': '30',
    'category': 'Plumber',
    'service': 'Drainage Pipes',
    'des':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim',
  },

  // {
  //   'name': 'David Miller',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 3.1',
  //   'hr': '22/h',
  //   'mail': 'davidmiller@gmail.com',
  //   'mobile': '0222566445',
  //   'category': 'Water Purifier',
  //   'des': '',
  // },
  // {
  //   'name': 'Ana Howard',
  //   'image': '',
  //   'exp': '6 Years Experience',
  //   'rate': '⭐ 4.9',
  //   'hr': '40/h',
  //   'mail': 'anahoward@gmail.com',
  //   'mobile': '0212065650',
  //   'category': 'Water Purifier',
  //   'des': '',
  // },
  // {
  //   'name': 'Brian Fraser',
  //   'image': '',
  //   'exp': '5 Years Experience',
  //   'rate': '⭐ 4.5',
  //   'hr': '35/h',
  //   'mail': 'brianfraser@gmail.com',
  //   'mobile': '0278562150',
  //   'category': 'Washing Machine',
  //   'des': '',
  // },
  // {
  //   'name': 'Keith Jackson',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.9',
  //   'hr': '30/h',
  //   'mail': 'keithjackson@gmail.com',
  //   'mobile': '0218326489',
  //   'category': 'Washing Machine',
  //   'des': '',
  // },
  // {
  //   'name': 'Mahesh Goti',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 2.9',
  //   'hr': '20/h',
  //   'mail': 'maheshgoti@gmail.com',
  //   'mobile': '0218726389',
  //   'category': 'Bathroom',
  //   'des': '',
  // },
  // {
  //   'name': 'Ramesh Kikani',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.5',
  //   'hr': '32/h',
  //   'mail': 'rameshkikani@gmail.com',
  //   'mobile': '0214326999',
  //   'category': 'Bathroom',
  //   'des': '',
  // },
  // {
  //   'name': 'Neel Koshiya',
  //   'image': '',
  //   'exp': '4 Years Experience',
  //   'rate': '⭐ 4.9',
  //   'hr': '38/h',
  //   'mail': 'neelkoshiya@gmail.com',
  //   'mobile': '0213326129',
  //   'category': 'Sofa',
  //   'des': '',
  // },
  // {
  //   'name': 'Smit Tank',
  //   'image': '',
  //   'exp': '6 Years Experience',
  //   'rate': '⭐ 4.9',
  //   'hr': '40/h',
  //   'mail': 'smittank@gmail.com',
  //   'mobile': '0218876409',
  //   'category': 'Sofa',
  //   'des': '',
  // },
  // {
  //   'name': 'Akshay Patil',
  //   'image': '',
  //   'exp': '5 Years Experience',
  //   'rate': '⭐ 4.6',
  //   'hr': '40/h',
  //   'mail': 'akshaypatil@gmail.com',
  //   'mobile': '0213326659',
  //   'category': 'Car',
  //   'des': '',
  // },
  // {
  //   'name': 'Rohit Zakur',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.6',
  //   'hr': '28/h',
  //   'mail': 'rohitzakur@gmail.com',
  //   'mobile': '0216526789',
  //   'category': 'Car',
  //   'des': '',
  // },
  // {
  //   'name': 'Pavan Gohil',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 2.6',
  //   'hr': '20/h',
  //   'mail': 'pavangohil@gmail.com',
  //   'mobile': '0278322089',
  //   'category': 'Kitchen',
  //   'des': '',
  // },
  // {
  //   'name': 'Vishal Pandey',
  //   'image': '',
  //   'exp': '4 Years Experience',
  //   'rate': '⭐ 4.9',
  //   'hr': '42/h',
  //   'mail': 'vishalpandey@gmail.com',
  //   'mobile': '0216326479',
  //   'category': 'Kitchen',
  //   'des': '',
  // },
  // {
  //   'name': 'Bhavin Dabhi',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 2.9',
  //   'hr': '20/h',
  //   'mail': 'bhavindabhi@gmail.com',
  //   'mobile': '0213226479',
  //   'category': 'Electrician',
  //   'des': '',
  // },
  // {
  //   'name': 'Jetha Jiyani',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.9',
  //   'hr': '30/h',
  //   'mail': 'jethajiyani@gmail.com',
  //   'mobile': '0216324107',
  //   'category': 'Electrician',
  //   'des': '',
  // },
  // {
  //   'name': 'Pinku Patel',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.6',
  //   'hr': '29/h',
  //   'mail': 'pinkupatel@gmail.com',
  //   'mobile': '0211326789',
  //   'category': 'Plumber',
  //   'des': '',
  // },
  // {
  //   'name': 'Goli Setha',
  //   'image': '',
  //   'exp': '4 Years Experience',
  //   'rate': '⭐ 4.9',
  //   'hr': '36/h',
  //   'mail': 'golisetha@gmail.com',
  //   'mobile': '0218327429',
  //   'category': 'Plumber',
  //   'des': '',
  // },
  // {
  //   'name': 'Rinkal Sindhi',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 2.6',
  //   'hr': '26/h',
  //   'mail': 'rinkalsindhi@gmail.com',
  //   'mobile': '0217326173',
  //   'category': 'Carpenter',
  //   'des': '',
  // },
  // {
  //   'name': 'Jemish Sutariya',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.9',
  //   'hr': '30/h',
  //   'mail': 'jemishsutariya@gmail.com',
  //   'mobile': '0218326465',
  //   'category': 'Carpenter',
  //   'des': '',
  // },
  // {
  //   'name': 'Princy Patil',
  //   'image': '',
  //   'exp': '3 Years Experience',
  //   'rate': '⭐ 3.6',
  //   'hr': '28/h',
  //   'mail': 'princypatil@gmail.com',
  //   'mobile': '0213326449',
  //   'category': 'xxx',
  //   'des': '',
  // },
  // {
  //   'name': 'Sajid Sai',
  //   'image': '',
  //   'exp': '2 Years Experience',
  //   'rate': '⭐ 2.1',
  //   'hr': '18/h',
  //   'mail': 'sajidsai@gmail.com',
  //   'mobile': '0214326669',
  //   'category': 'xxx',
  //   'des': '',
  // },
];
