part of 'object_cubit.dart';

@immutable
abstract class ObjectState {}

class ObjectsLoading extends ObjectState {}

class ObjectsLoaded extends ObjectState {
  final List<PatriotObject> list;

  ObjectsLoaded(this.list);
}

class ObjectsError extends ObjectState {
  final String error;

  ObjectsError(this.error);
}