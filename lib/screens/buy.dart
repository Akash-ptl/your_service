import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_service/global.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:your_service/screens/home.dart';

class BuyPage extends StatefulWidget {
  int ind;
  final User user;

  BuyPage({required this.ind, required this.user});

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;

    super.initState();
  }

  int currentStep = 0;
  String groupValue = "";
  Widget title({required String text, required Icon icon}) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          style: GoogleFonts.comfortaa(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget payment(
      {required String text, required String value, required Icon icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.comfortaa(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Radio(
            value: value,
            activeColor: blackColor,
            groupValue: groupValue,
            onChanged: (val) {
              setState(() {
                groupValue = val.toString();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Form(
        key: buyNow,
        child: Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(primary: blackColor),
          ),
          child: Stepper(
            physics: const BouncingScrollPhysics(),
            elevation: 1,
            type: StepperType.horizontal,
            currentStep: currentStep,
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "BACK",
                            style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            setState(() {
                              if (currentStep > 0) currentStep--;
                            });
                          },
                        ),
                      ),
                    if (currentStep != 0) const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          currentStep == 2 ? "CONFIRM" : "SAVE & NEXT",
                          style: GoogleFonts.comfortaa(
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          setState(() {
                            if (currentStep == 0) {
                              if (buyNow.currentState!.validate()) {
                                if (currentStep < 2) currentStep++;
                                buyNow.currentState!.save();
                              }
                            } else if (currentStep == 1) {
                              if (groupValue != "") {
                                if (currentStep < 2) currentStep++;
                              }
                            } else {
                              if (currentStep < 2) currentStep++;
                              setState(() {
                                addOrder.addAll([
                                  {
                                    'img': person[widget.ind]['image'],
                                    'cat': person[widget.ind]['category'],
                                    'val': person[widget.ind]['hr'],
                                    'rate': person[widget.ind]['rate']
                                  }
                                ].reversed);
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDone(
                                          user: widget.user,
                                        )),
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                state:
                    (currentStep > 0) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 0,
                title: Text(
                  "Address",
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(
                        text: "Contact Details",
                        icon: const Icon(CupertinoIcons.phone)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: userName,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                      style: GoogleFonts.comfortaa(
                        color: blackColor,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        hintText: "Full Name",
                        hintStyle: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 16,
                        ),
                        errorStyle: GoogleFonts.comfortaa(),
                      ),
                      onSaved: (val) {
                        setState(() {
                          userName = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      initialValue: userPhone,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Phone Number";
                        }
                        return null;
                      },
                      style: GoogleFonts.comfortaa(
                        color: blackColor,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: blackColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 16,
                        ),
                        errorStyle: GoogleFonts.comfortaa(),
                      ),
                      onSaved: (val) {
                        setState(() {
                          userPhone = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    title(
                        text: "Address",
                        icon: const Icon(CupertinoIcons.location)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: userAdd,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Address";
                        }
                        return null;
                      },
                      style: GoogleFonts.comfortaa(
                        color: blackColor,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                        ),
                        hintText: "Address",
                        hintStyle: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 16,
                        ),
                        errorStyle: GoogleFonts.comfortaa(),
                      ),
                      onSaved: (val) {
                        setState(() {
                          userAdd = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: userPinCode,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Pin Code";
                              }
                              return null;
                            },
                            style: GoogleFonts.comfortaa(
                              color: blackColor,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              hintText: "Pin Code",
                              hintStyle: GoogleFonts.comfortaa(
                                color: greyColor,
                                fontSize: 16,
                              ),
                              errorStyle: GoogleFonts.comfortaa(),
                            ),
                            onSaved: (val) {
                              setState(() {
                                userPinCode = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: userCity,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your City";
                              }
                              return null;
                            },
                            style: GoogleFonts.comfortaa(
                              color: blackColor,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              hintText: "City",
                              hintStyle: GoogleFonts.comfortaa(
                                color: greyColor,
                                fontSize: 16,
                              ),
                              errorStyle: GoogleFonts.comfortaa(),
                            ),
                            onSaved: (val) {
                              setState(() {
                                userCity = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: userState,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your State";
                              }
                              return null;
                            },
                            style: GoogleFonts.comfortaa(
                              color: blackColor,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              hintText: "State",
                              hintStyle: GoogleFonts.comfortaa(
                                color: greyColor,
                                fontSize: 16,
                              ),
                              errorStyle: GoogleFonts.comfortaa(),
                            ),
                            onSaved: (val) {
                              setState(() {
                                userState = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: userCountry,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your Country";
                              }
                              return null;
                            },
                            style: GoogleFonts.comfortaa(
                              color: blackColor,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: blackColor,
                                ),
                              ),
                              hintText: "Country",
                              hintStyle: GoogleFonts.comfortaa(
                                color: greyColor,
                                fontSize: 16,
                              ),
                              errorStyle: GoogleFonts.comfortaa(),
                            ),
                            onSaved: (val) {
                              setState(() {
                                userCountry = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Step(
                state:
                    (currentStep > 1) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                title: Text(
                  "Payment",
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  children: [
                    payment(
                        text: "UPI (GPay / PhonePe)",
                        icon: const Icon(CupertinoIcons.briefcase, size: 26),
                        value: 'UPI (GPay / PhonePe)'),
                    payment(
                        text: "Wallet",
                        icon: const Icon(Icons.account_balance_wallet_outlined,
                            size: 26),
                        value: 'Wallet'),
                    payment(
                        text: "Debit / Credit Card",
                        icon: const Icon(Icons.credit_card_rounded, size: 26),
                        value: 'Debit / Credit Card'),
                    payment(
                        text: "Net Banking",
                        icon: const Icon(Icons.account_balance_outlined,
                            size: 26),
                        value: 'Net Banking'),
                    payment(
                        text: "Cash on Delivery",
                        icon: const Icon(CupertinoIcons.money_dollar_circle,
                            size: 26),
                        value: 'Cash on Delivery'),
                  ],
                ),
              ),
              Step(
                state:
                    (currentStep > 2) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 2,
                title: Text(
                  "Summary",
                  style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '${_currentUser.displayName}',
                                style: GoogleFonts.comfortaa(
                                  color: blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              AutoSizeText(
                                '${_currentUser.email}',
                                style: GoogleFonts.comfortaa(
                                  color: blackColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Delivery Address",
                        style: GoogleFonts.comfortaa(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "$userName +91 $userPhone",
                        style: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$userAdd, $userCity, $userState, $userCountry - $userPinCode",
                        style: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Mode",
                        style: GoogleFonts.comfortaa(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        groupValue,
                        style: GoogleFonts.comfortaa(
                          color: greyColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price Details",
                        style: GoogleFonts.comfortaa(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Total Price",
                          style: GoogleFonts.comfortaa(
                            color: greyColor,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "+ 1000",
                          style: GoogleFonts.comfortaa(
                            color: blackColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Total Discounts",
                          style: GoogleFonts.comfortaa(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "- \$${0}",
                          style: GoogleFonts.comfortaa(
                            color: Colors.red,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Order Total",
                          style: GoogleFonts.comfortaa(
                            color: blackColor,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "total price",
                          style: GoogleFonts.comfortaa(
                            color: blackColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class OrderDone extends StatefulWidget {
  final User user;

  const OrderDone({required this.user});

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.network('http://web.exyu.tv/images/done.gif',
                height: 150, repeat: ImageRepeat.noRepeat),
            const Spacer(),
            Text(
              "Your Service\nHas Been Accepted",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                color: blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Your Service Will be Delivered soon.\nThank You For Choosing our App!",
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                color: greyColor,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: h / 20,
                width: w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(
                                user: widget.user,
                              )),
                      ModalRoute.withName('/'),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    'Back To Home',
                    style: GoogleFonts.comfortaa(fontSize: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
