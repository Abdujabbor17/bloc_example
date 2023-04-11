import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/post_model.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadPostsEvent extends HomeEvent {

}

class DeletePostEvent extends HomeEvent {
  final PostModel post;

  const DeletePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

