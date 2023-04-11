import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../model/post_model.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {

}

class HomeLoadingState extends HomeState {
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

}

class HomePostListState extends HomeState {
  final List<PostModel> posts;

  HomePostListState(this.posts);

  @override
  List<Object> get props => [posts];
}

class HomeDeletePostState extends HomeState {

}

