part of 'object_cubit.dart';

@immutable
abstract class ObjectState {}

class ObjectsLoading extends ObjectState {}

class ObjectsLoaded extends ObjectState {
  final List<PatriotObject> objectList;
  final List<Status> statusList;

  ObjectsLoaded(this.objectList, this.statusList);

}

class ObjectsError extends ObjectState {
  final String error;

  ObjectsError(this.error);
}