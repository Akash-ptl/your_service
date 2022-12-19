import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, right: 20.0, left: 15.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 24,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'Select Date',
                      style: GoogleFonts.comfortaa(
                        fontSize: 18,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, top: 19),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: blackColor, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: TableCalendar(
                        calendarFormat: CalendarFormat.week,
                        rowHeight: 70,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          formatButtonTextStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                          titleTextStyle: GoogleFonts.comfortaa(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          weekendStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        availableGestures: AvailableGestures.horizontalSwipe,
                        focusedDay: selectDay,
                        selectedDayPredicate: (DateTime date) {
                          return isSameDay(selectDay, date);
                        },
                        calendarStyle: CalendarStyle(
                          isTodayHighlighted: true,
                          selectedDecoration: BoxDecoration(
                              color: blackColor, shape: BoxShape.circle),
                          todayDecoration: const BoxDecoration(
                              color: Colors.black26, shape: BoxShape.circle),
                        ),
                        firstDay: DateTime.now(),
                        lastDay: DateTime.utc(2030, 3, 14),
                        onDaySelected: (DateTime selectday, DateTime focusday) {
                          setState(() {
                            selectDay = selectday;
                            focusDay = focusday;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Text(
                      'Select Time',
                      style: GoogleFonts.comfortaa(
                        fontSize: 18,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 210,
                    child: GridView.count(
                      childAspectRatio: 15 / 4.9,
                      crossAxisCount: 2,
                      children: hour.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 15, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (e['clr'] == false) {
                                  e['clr'] = true;
                                } else {
                                  e['clr'] = false;
                                }
                                // e['clr'] = !e['clr'];
                                //reportReason.isSelected = !reportReason.isSelected;
                                // if(e['clr'] == false)
                                // {
                                //   e['clr'] = true;
                                // }
                                // else {
                                //   e['clr'] = false;
                                // }
                                // if(slotColor == slotColorFixed)
                                //   {
                                //
                                //   }
                                // slotColorFixed = (e['slot'] == '0') ? slotColor : blackColor;
                                // slotColorFixed = (e['slot'] == '1') ? Colors.red : Colors.black;
                                // slotColorFixed = (e['slot'] == '2') ? slotColor : blackColor;
                                // slotColorFixed = (e['slot'] == '3') ? slotColor : blackColor;
                                // slotColorFixed = (e['slot'] == '4') ? slotColor : blackColor;

                                // if(e['slot'] == '0')
                                //   {
                                //     e['slot'] = '1';
                                //   }
                                // else
                                //   {
                                //     e['slot'] = '0';
                                //   }
                                // for(int i = 0 ; i<= 4 ; i++)
                                //   {
                                //     if(hour[i]['slot'] == 0 || hour[i]['slot'] == 1 )
                                //   }
                                // if(e['clr'] == false && e['slot'] == false)
                                // {
                                //   // if(e['slot'] == false)
                                //   //   {
                                //        e['clr'] = true;
                                //        e['slot'] = true;
                                //   //   }
                                //   // dateColor = selectColor;
                                //   // slot.add(selectDay.day);
                                //   // print("demo ${slot}");
                                // }
                                // else {
                                //
                                //     if(e['slot'] ==  false)
                                //       {
                                //         e['slot'] ==  false;
                                //        // e['clr'] = false;
                                //         //e['slot'] = false;
                                //       }
                                //   //slotBook = false;
                                //   //dateColor = blackColor;
                                // }
                                // for(no = 0 ; no < date.length ; no++)
                                //   {
                                //     print(date);
                                //     print(date.length);
                                //     if(date[no] == selectDay.day)
                                //       {
                                //         //print(selectDay.day);
                                //         // print("no ==== ${slot[no]}");
                                //         // if(slot[0] == selectDay.day)
                                //         //   {
                                //         //     e['clr'] = true;
                                //         //     dateColor = selectColor;
                                //         //   }
                                //        // else
                                //          // {
                                //             if(e['clr'] == false)
                                //             {
                                //               e['clr'] = true;
                                //               dateColor = selectColor;
                                //               slot.add(selectDay.day);
                                //               print("demo ${slot}");
                                //             }
                                //             else {
                                //               e['clr'] = false;
                                //               dateColor = blackColor;
                                //             }
                                //          // }
                                //       }
                                //     // else
                                //     //     {
                                //     //       e['clr'] = false;
                                //     //     }
                                //   }
                              });
                            },
                            child: Container(
                              height: h / 2,
                              //height: 10,
                              //width: 450,
                              decoration: BoxDecoration(
                                //color: blackColor,
                                border: Border.all(
                                  //color: dateColor,
                                  color: (e['clr']) ? selectColor : blackColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "${e['time']}",
                                style: GoogleFonts.comfortaa(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    height: h / 15,
                    width: w / 1,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 2,
                          offset: const Offset(0, 0)),
                    ]),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushNamed(context, 'review');
                        });
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 9),
                          child: Container(
                            height: h / 20,
                            width: w / 2.8,
                            decoration: BoxDecoration(
                              color: blackColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Get Now',
                              style: GoogleFonts.comfortaa(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
