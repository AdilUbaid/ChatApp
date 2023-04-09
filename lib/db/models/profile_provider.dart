// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';

// class ProfileProvider {
//   UploadTask uploadImageFile(File image, String fileName) {
//     Reference reference = firebaseStorage.ref().child(fileName);
//     UploadTask uploadTask = reference.putFile(image);
//     return uploadTask;
//   }

//   Future<void> updateFirestoreData(String collectionPath, String path,
//       Map<String, dynamic> dataUpdateNeeded) {
//     return firebaseFirestore
//         .collection(collectionPath)
//         .doc(path)
//         .update(dataUpdateNeeded);
//   }
// }
