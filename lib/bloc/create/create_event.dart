import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../model/post_model.dart';

@immutable
abstract class CreateEvent extends Equatable {
  const CreateEvent();
}

class CreatePostEvent extends CreateEvent {
  final PostModel post;

  const CreatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}
