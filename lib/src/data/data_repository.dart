import 'dart:async';

class DataRepository<T> {
  final _dataStreamController = StreamController<T>();

  Sink<T> get dataSink => _dataStreamController.sink;

  Stream<T> get dataStream => _dataStreamController.stream;
}
