import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/post_service.dart';
import 'create_event.dart';
import 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc() : super(CreateInitialState()) {
    on<CreatePostEvent>(_onCreatePost);
  }

  Future<void> _onCreatePost(CreatePostEvent event, Emitter<CreateState> emit) async {
    emit(CreateLoadingState());
    final response = await GetPostService.createPost(event.post);

    response.fold((l) {
      emit(CreateErrorState(l));
    }, (r) {
      emit(CreatedPostState(r));
    });
  }
}
