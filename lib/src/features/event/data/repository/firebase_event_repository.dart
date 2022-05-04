import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_timerman/src/core/services/firestore_service.dart';
import 'package:flutter_timerman/src/features/event/data/api/api_path.dart';
import 'package:flutter_timerman/src/features/event/domain/models/partner.dart';
import 'package:flutter_timerman/src/features/event/domain/repository/event_repository.dart';
import 'package:flutter_timerman/src/features/events/domain/models/event.dart';

class FirebaseEventRepository implements EventRepository {
  final _service = FirestoreService.instance;

  @override
  Future<void> addEvent({required Event event}) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }

  @override
  Future<void> deleteEvent({required String eventId}) {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<void> updateEvent({required Event event}) {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }

  Future<List<Partner>> getPartner(QuerySnapshot snapshot) async {
    return Future.wait(
      snapshot.docs.map((doc) async {
        final data = doc.data()! as Map<String, dynamic>;
        final docRef =
            data['partner_id'] as DocumentReference<Map<String, dynamic>>;
        return _service.documentByReference<Partner>(
          reference: docRef,
          builder: (data, documentId) {
            return Partner.fromJson(data).copyWith(id: documentId);
          },
        );
      }),
    );
  }

  @override
  Stream<List<Partner>> getPartners({required String eventId}) {
    /*return _service
        .collectionReference(APIPath.partners(eventId: eventId))
        .snapshots()
        .asyncMap<List<Partner>>(getPartner);
        */
    return _service
        .collectionReference(APIPath.partners(eventId: eventId))
        .snapshots()
        .asyncMap<List<Partner>>(
          (snapshot) => Future.wait(
            snapshot.docs.map((doc) async {
              final data = doc.data()! as Map<String, dynamic>;
              final docRef =
                  data['partner_id'] as DocumentReference<Map<String, dynamic>>;
              return _service.documentByReference<Partner>(
                reference: docRef,
                builder: (data, documentId) {
                  return Partner.fromJson(data).copyWith(id: documentId);
                },
              );
            }),
          ),
        );
  }
}
