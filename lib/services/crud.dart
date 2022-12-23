import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_service/models/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Workers');
final CollectionReference _Collect = _firestore.collection('Orders');
final CollectionReference _Collectuser = _firestore.collection('Users');
final CollectionReference _Collectcrsl =
    _firestore.collection('carouselslider');
final CollectionReference _Collecthistory = _firestore.collection('History');
final CollectionReference _Collectfav = _firestore.collection('Favourite');
final CollectionReference _Collectreview = _firestore.collection('Review');

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
    required String category,
    required String price,
    required String service,
    required image,
  }) async {
    Response resp = Response();
    DocumentReference documentRef = _Collect.doc();

    Map<String, dynamic> list = <String, dynamic>{
      "Name": name,
      "Category": category,
      "Price": price,
      "Service": service,
      "Image": image,
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

  static Future<Response> addFavourite({
    required String name,
    required String category,
    required String service,
    required String image,
  }) async {
    Response res = Response();
    DocumentReference documentR = _Collectfav.doc();

    Map<String, dynamic> favlist = <String, dynamic>{
      "Name": name,
      "Category": category,
      "Service": service,
      "Image": image,
    };

    var result = await documentR.set(favlist).whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully added to the database";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }

  static Future<Response> addHistory({
    required String name,
    required String category,
    required String price,
    required String service,
    required image,
  }) async {
    Response resp = Response();
    DocumentReference documentRef = _Collecthistory.doc();

    Map<String, dynamic> history = <String, dynamic>{
      "Name": name,
      "Category": category,
      "Price": price,
      "Service": service,
      "Image": image,
    };

    var result = await documentRef.set(history).whenComplete(() {
      resp.code = 200;
      resp.message = "Sucessfully added to the database";
    }).catchError((e) {
      resp.code = 500;
      resp.message = e;
    });

    return resp;
  }

  static Future<Response> addUser({
    required String name,
    required String email,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collectuser.doc();

    Map<String, dynamic> userlist = <String, dynamic>{
      "Name": name,
      "Email": email,
    };

    var result = await documentRe.set(userlist).whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully added to the database";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }

  static Future<Response> addReview({
    required String title,
    required String brief,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collectreview.doc();

    Map<String, dynamic> reviewlist = <String, dynamic>{
      "Title": title,
      "Brief": brief,
    };

    var result = await documentRe.set(reviewlist).whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully added to the database";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
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

  static Stream<QuerySnapshot> readUser() {
    CollectionReference notesItemCollection = _Collectuser;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readOrder() {
    CollectionReference notesItemCollection = _Collect;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readCrsl() {
    CollectionReference notesItemCollection = _Collectcrsl;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readHistory() {
    CollectionReference notesItemCollection = _Collecthistory;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readFavourite() {
    CollectionReference notesItemCollection = _Collectfav;

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readReview() {
    CollectionReference notesItemCollection = _Collectreview;

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

  static Future<Response> deleteUser({
    required String docId,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collectuser.doc(docId);

    await documentRe.delete().whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }

  static Future<Response> deleteHistory({
    required String docId,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collecthistory.doc(docId);

    await documentRe.delete().whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }

  static Future<Response> deleteFavourite({
    required String docId,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collectfav.doc(docId);

    await documentRe.delete().whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }

  static Future<Response> deleteReview({
    required String docId,
  }) async {
    Response res = Response();
    DocumentReference documentRe = _Collectreview.doc(docId);

    await documentRe.delete().whenComplete(() {
      res.code = 200;
      res.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      res.code = 500;
      res.message = e;
    });

    return res;
  }
}
