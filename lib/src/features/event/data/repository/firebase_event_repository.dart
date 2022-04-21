import 'package:flutter_timerman/src/features/event/domain/repository/event_repository.dart';
import 'package:flutter_timerman/src/features/events/domain/models/event.dart';

class FirebaseEventRepository implements EventRepository {
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
}
