import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/post_service.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<DeletePostEvent>(_onDeletePost);
  }

  Future<void> _onLoadPosts(
      LoadPostsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await GetPostService.getPosts();

    response.fold((l) {
      emit(HomeErrorState(l));
    }, (r) {
      emit(HomePostListState(r));
    });

  }

  Future<void> _onDeletePost(DeletePostEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await GetPostService.deletePost(event.post.id);

    response.fold((l) {
      emit(HomeErrorState(l));
    }, (r) {
      emit(HomeDeletePostState());
    });
  }


  // void callCreatePage(BuildContext context) async {
  //   var results = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => BlocProvider(
  //             create: (context) => CreateBloc(),
  //             child: const CreatePage(),
  //           )));
  //   if (results != null) {
  //     add(LoadPostsEvent());
  //   }
  // }
  //
  // void callUpdatePage(BuildContext context, Post post) async {
  //   var results = await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => BlocProvider(
  //             create: (context) => UpdateBloc(),
  //             child: UpdatePage(post: post),
  //           )));
  //   if (results != null) {
  //     add(LoadPostsEvent());
  //   }
  // }
}
