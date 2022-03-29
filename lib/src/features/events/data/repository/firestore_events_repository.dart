import 'package:flutter_timerman/src/core/services/firestore_service.dart';
import 'package:flutter_timerman/src/features/events/domain/models/models.dart';
import 'package:flutter_timerman/src/features/events/domain/repositrory/repository.dart';

import '../api/api_path.dart';

class FirestoreEventsRepository extends EventsRepository {
  final _service = FirestoreService.instance;

  @override
  Stream<List<Event>> getEvents({required Filter filter}) {
    return _service.collectionStream<Event>(
      path: APIPath.event(),
      builder: (data, documentId) {
        return Event.fromJson(data).copyWith(id: documentId);
      },
    );
  }
}
