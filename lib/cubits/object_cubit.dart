import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/models/status/status.dart';
import 'package:patriot/services/api_service.dart';

part 'object_state.dart';

class ObjectCubit extends Cubit<ObjectState> {
  ObjectCubit() : super(ObjectsLoading());
  final ApiService _apiService = ApiService();

  Future<void> loadData() async {
    try{
      emit(ObjectsLoading());
      List<PatriotObject> _patriotObjects = await _apiService.getObjects();
      List<Status> _statuses = [];
      for(int i = 0; i < _patriotObjects.length; i++){
        List<Status> _list = await _apiService.getStatuses(_patriotObjects[i].id!);
        _patriotObjects[i].list!.add(_list[0]);
        _statuses.addAll(_list);
      }
      _statuses.sort((a, b) => b.eventDate!.compareTo(a.eventDate!));
      emit(ObjectsLoaded(_patriotObjects, _statuses));
    } catch (e){
      emit(ObjectsError(e.toString()));
    }
  }

}
