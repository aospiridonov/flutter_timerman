import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

typedef Builder<T> = T Function(
  Map<String, dynamic> data,
  String documentId,
);

class FirestoreService {
  FirestoreService._();

  static final instance = FirestoreService._();

  CollectionReference collectionReference(String path) {
    return FirebaseFirestore.instance.collection(path);
  }

  DocumentReference documentReference(String path) {
    return FirebaseFirestore.instance.doc(path);
  }

  Future<String> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = collectionReference(path);
    final docReference = await reference.add(data);
    return docReference.id;
  }

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = documentReference(path);
    return reference.set(data, SetOptions(merge: merge));
  }

  Future<void> deleteData({
    required String documentPath,
  }) async {
    final reference = documentReference(documentPath);
    return reference.delete();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required Builder<T> builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = collectionReference(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map(
      (snapshot) {
        return snapshot.docs
            .map(
              (snapshot) => builder(
                snapshot.data()! as Map<String, dynamic>,
                snapshot.id,
              ),
            )
            .where((value) => value != null)
            .toList();
      },
    );
  }

  Stream<T> documentStream<T>({
    required String path,
    required Builder<T> builder,
  }) {
    final reference = documentReference(path);
    final snapshots = reference.snapshots();
    return snapshots.map(
      (snapshot) => builder(
        snapshot.data()! as Map<String, dynamic>,
        snapshot.id,
      ),
    );
  }

  Future<T> documentByReference<T>({
    required DocumentReference reference,
    required Builder<T> builder,
  }) async {
    final snapshot = await reference.get();
    return builder(
      snapshot.data()! as Map<String, dynamic>,
      snapshot.id,
    );
  }
}
