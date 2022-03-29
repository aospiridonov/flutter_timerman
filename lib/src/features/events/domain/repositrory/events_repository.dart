import 'package:flutter_timerman/src/features/events/domain/models/models.dart';

abstract class EventsRepository {
  Stream<List<Event>> getEvents({required Filter filter});
}
