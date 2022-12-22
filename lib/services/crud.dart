import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_service/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Workers');
final CollectionReference _Collect = _firestore.collection('Orders');

class FirebaseCrud {
  static Future<Response> addWorker({
    required String name,
    required String category,
    required String service,
    required String price,
    required String time,
    required String experience,
    required String details,
    required String rating,
    required String image,
    required String id,
    required String wimage,
    required String gender,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "Category": category,
      "Service": service,
      "Name": name,
      "Price": price,
      "Time": time,
      "Experience": experience,
      "Details": details,
      "Rating": rating,
      "Image": image,
      "Id": id,
      "WImage": wimage,
      "Gender": gender,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> addOrder({
    required String name,
  }) async {
    Response resp = Response();
    DocumentReference documentRef = _Collect.doc();

    Map<String, dynamic> list = <String, dynamic>{
      "Name": name,
    };

    var result = await documentRef.set(list).whenComplete(() {
      resp.code = 200;
      resp.message = "Sucessfully added to the database";
    }).catchError((e) {
      resp.code = 500;
      resp.message = e;
    });

    return resp;
  }

  static Future<Response> updateWorker({
    required String name,
    required String category,
    required String service,
    required String price,
    required String time,
    required String experience,
    required String details,
    required String rating,
    required String image,
    required String id,
    required String docId,
    required String wimage,
    required String gender,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "Category": category,
      "Service": service,
      "Name": name,
      "Price": price,
      "Time": time,
      "Experience": experience,
      "Details": details,
      "Rating": rating,
      "Image": image,
      "Id": id,
      "Id": id,
      "WImage": wimage,
      "Gender": gender,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Stream<QuerySnapshot> readWorker() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readOrder() {
    CollectionReference notesItemCollection = _Collect;

    return notesItemCollection.snapshots();
  }

  // static Future<Response> addcategory({
  //   required String name,
  //   required String image,
  // }) async {
  //   Response response = Response();
  //   DocumentReference documentReferencer = _Collect.doc();

  //   Map<String, dynamic> category = <String, dynamic>{
  //     "Name": name,
  //     "Image": image,
  //   };

  //   var result = await documentReferencer.set(category).whenComplete(() {
  //     response.code = 200;
  //     response.message = "Sucessfully added to the database";
  //   }).catchError((e) {
  //     response.code = 500;
  //     response.message = e;
  //   });

  //   return response;
  // }

  // static Stream<QuerySnapshot> readcategory() {
  //   CollectionReference notesItemCollection = _Collect;

  //   return notesItemCollection.snapshots();
  // }

  static Future<Response> deleteWorker({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  static Future<Response> deleteOrder({
    required String docId,
  }) async {
    Response resp = Response();
    DocumentReference documentRef = _Collect.doc(docId);

    await documentRef.delete().whenComplete(() {
      resp.code = 200;
      resp.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      resp.code = 500;
      resp.message = e;
    });

    return resp;
  }
}
