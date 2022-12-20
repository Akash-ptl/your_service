// import 'package:flutter/material.dart';
// import 'package:your_service/admin/list.dart';
// import 'package:your_service/services/crud.dart';

// class AddPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _AddPage();
//   }
// }

// class _AddPage extends State<AddPage> {
//   final _employee_name = TextEditingController();
//   final _employee_position = TextEditingController();
//   final _employee_contact = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final nameField = TextFormField(
//         controller: _employee_name,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Name",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//     final positionField = TextFormField(
//         controller: _employee_position,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Position",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
//     final contactField = TextFormField(
//         controller: _employee_contact,
//         autofocus: false,
//         validator: (value) {
//           if (value == null || value.trim().isEmpty) {
//             return 'This field is required';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//             hintText: "Contact Number",
//             border:
//                 OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

//     final viewListbutton = TextButton(
//         onPressed: () {
//           Navigator.pushAndRemoveUntil<dynamic>(
//             context,
//             MaterialPageRoute<dynamic>(
//               builder: (BuildContext context) => ListPage(),
//             ),
//             (route) => false, //if you want to disable back feature set to false
//           );
//         },
//         child: const Text('View List of Employee'));

//     final SaveButon = Material(
//       elevation: 5.0,
//       borderRadius: BorderRadius.circular(30.0),
//       color: Theme.of(context).primaryColor,
//       child: MaterialButton(
//         minWidth: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//         onPressed: () async {
//           if (_formKey.currentState!.validate()) {
//             var response = await FirebaseCrud.addWorker(
//                 name: _employee_name.text,
//                 category: _employee_position.text,
//                 service: _employee_contact.text);
//             if (response.code != 200) {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(response.message.toString()),
//                     );
//                   });
//             } else {
//               showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       content: Text(response.message.toString()),
//                     );
//                   });
//             }
//           }
//         },
//         child: Text(
//           "Save",
//           style: TextStyle(color: Theme.of(context).primaryColorLight),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('FreeCode Spot'),
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Form(
//             key: _formKey,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   nameField,
//                   const SizedBox(height: 25.0),
//                   positionField,
//                   const SizedBox(height: 35.0),
//                   contactField,
//                   viewListbutton,
//                   const SizedBox(height: 45.0),
//                   SaveButon,
//                   const SizedBox(height: 15.0),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:your_service/services/crud.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _addFormKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _serviceController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _timeController = TextEditingController();
  final _experienceController = TextEditingController();
  final _detailsController = TextEditingController();
  final _ratingController = TextEditingController();
  final _imageController = TextEditingController();
  final _crslController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: IndexedStack(
            index: index,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _addFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _categoryController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Category Name",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _serviceController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Service Name",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _nameController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Worker Name",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _priceController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Price",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _timeController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Time to Complete",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _experienceController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Experience",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _detailsController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Details",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _ratingController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Rating",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _imageController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Image URl",
                            hintStyle: GoogleFonts.comfortaa(),
                            errorStyle: GoogleFonts.comfortaa(),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _crslController,
                    autofocus: false,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    style: GoogleFonts.comfortaa(),
                    decoration: InputDecoration(
                      hintText: "Image URl",
                      hintStyle: GoogleFonts.comfortaa(),
                      errorStyle: GoogleFonts.comfortaa(),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
      floatingActionButton: SizedBox(
        width: w,
        child: ElevatedButton(
          onPressed: () async {
            if (_addFormKey.currentState!.validate()) {
              var response = await FirebaseCrud.addWorker(
                category: _categoryController.text,
                name: _nameController.text,
                service: _serviceController.text,
                details: _detailsController.text,
                experience: _experienceController.text,
                price: _priceController.text,
                time: _timeController.text,
                rating: _ratingController.text,
                image: _imageController.text,
              );
              if (response.code != 200) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              }
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            'Add',
            style: GoogleFonts.comfortaa(fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
