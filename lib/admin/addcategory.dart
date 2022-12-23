import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/global.dart';
import 'package:your_service/services/crud.dart';

class AddCategoryPage extends StatefulWidget {
  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _addFormKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _imageController = TextEditingController();

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
                          toolbarOptions: const ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true),
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
                          controller: _imageController,
                          autofocus: false,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'This field is required';
                            }
                            return null;
                          },
                          toolbarOptions: const ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: true,
                              selectAll: true),
                          style: GoogleFonts.comfortaa(),
                          decoration: InputDecoration(
                            hintText: "Image URL",
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
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(12),
        width: w,
        child: ElevatedButton(
          onPressed: () async {
            // if (_addFormKey.currentState!.validate()) {
            //   var response = await FirebaseCrud.addcategory(
            //     name: _categoryController.text,
            //     image: _imageController.text,
            //   );
            //   if (response.code != 200) {
            //     showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             content: Text(response.message.toString()),
            //           );
            //         });
            //   } else {
            //     showDialog(
            //         context: context,
            //         builder: (context) {
            //           return AlertDialog(
            //             content: Text(response.message.toString()),
            //           );
            //         });
            //   }
            // }
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
