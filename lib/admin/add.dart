import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final _idController = TextEditingController();
  final _wimageController = TextEditingController();
  final _genderController = TextEditingController();

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
          child: Form(
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  controller: _genderController,
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
                  style: GoogleFonts.comfortaa(),
                  decoration: InputDecoration(
                    hintText: "Gender",
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
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
                TextFormField(
                  controller: _idController,
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
                  style: GoogleFonts.comfortaa(),
                  decoration: InputDecoration(
                    hintText: "Id",
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
                  controller: _wimageController,
                  autofocus: false,
                  toolbarOptions: const ToolbarOptions(
                      copy: true, cut: true, paste: true, selectAll: true),
                  style: GoogleFonts.comfortaa(),
                  decoration: InputDecoration(
                    hintText: "Worker Image URL",
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
          )),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(50),
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
                id: _idController.text,
                wimage: _wimageController.text,
                gender: _genderController.text,
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
