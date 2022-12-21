import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_service/models/workers.dart';
import 'package:your_service/services/crud.dart';

class EditPage extends StatefulWidget {
  final Workers? worker;
  const EditPage({this.worker});

  @override
  State<StatefulWidget> createState() {
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _categoryController = TextEditingController();
  final _serviceController = TextEditingController();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _timeController = TextEditingController();
  final _experienceController = TextEditingController();
  final _detailsController = TextEditingController();
  final _ratingController = TextEditingController();
  final _imageController = TextEditingController();
  final _docid = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _docid.value = TextEditingValue(text: widget.worker!.uid.toString());
    _categoryController.value =
        TextEditingValue(text: widget.worker!.category.toString());
    _serviceController.value =
        TextEditingValue(text: widget.worker!.service.toString());
    _nameController.value =
        TextEditingValue(text: widget.worker!.name.toString());
    _priceController.value =
        TextEditingValue(text: widget.worker!.price.toString());
    _timeController.value =
        TextEditingValue(text: widget.worker!.time.toString());
    _experienceController.value =
        TextEditingValue(text: widget.worker!.experience.toString());
    _detailsController.value =
        TextEditingValue(text: widget.worker!.details.toString());
    _ratingController.value =
        TextEditingValue(text: widget.worker!.rating.toString());
    _imageController.value =
        TextEditingValue(text: widget.worker!.image.toString());
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Edit',
          style: GoogleFonts.comfortaa(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Category : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Service Name : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Worker Name : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Price : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Time to Complete : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Experience : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Details : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'rating : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
                    style: GoogleFonts.comfortaa(color: Colors.grey),
                    decoration: InputDecoration(
                      prefixText: 'Image URL : ',
                      prefixStyle: GoogleFonts.comfortaa(),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(50),
        width: w,
        child: ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              var response = await FirebaseCrud.updateWorker(
                category: _categoryController.text,
                name: _nameController.text,
                service: _serviceController.text,
                details: _detailsController.text,
                experience: _experienceController.text,
                price: _priceController.text,
                time: _timeController.text,
                rating: _ratingController.text,
                image: _imageController.text,
                docId: _docid.text,
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
            'Update',
            style: GoogleFonts.comfortaa(fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
