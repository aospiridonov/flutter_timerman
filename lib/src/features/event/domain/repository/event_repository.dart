import 'package:flutter_timerman/src/features/events/domain/models/event.dart';

abstract class EventRepository {
  // may be add description and more info
  Future<void> addEvent({required Event event});
  Future<void> deleteEvent({required String eventId});
  Future<void> updateEvent({required Event event});
}
