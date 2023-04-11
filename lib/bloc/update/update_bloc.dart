import 'package:bloc_pattern/bloc/update/update_event.dart';
import 'package:bloc_pattern/bloc/update/update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/post_service.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitialState()) {
    on<UpdatePostEvent>(_onUpdatePost);
  }

  Future<void> _onUpdatePost(
      UpdatePostEvent event, Emitter<UpdateState> emit) async {
    emit(UpdateLoadingState());

    final response = await GetPostService.updatePost(event.post);

    response.fold((l) {
      emit(UpdateErrorState(l));
    }, (r) {
      emit(UpdatedPostState(r));
    });

  }
}
