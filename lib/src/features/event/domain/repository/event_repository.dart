import 'package:flutter_timerman/src/features/event/domain/models/models.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';

abstract class EventRepository {
  // may be add description and more info
  Future<void> addEvent({required Event event});
  Future<void> deleteEvent({required String eventId});
  Future<void> updateEvent({required Event event});

  Stream<List<Partner>> getPartners({required String eventId});
}
