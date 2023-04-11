import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/post_model.dart';

@immutable
abstract class CreateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateInitialState extends CreateState {

}

class CreateLoadingState extends CreateState {
}

class CreateErrorState extends CreateState {
  final String errorMessage;

  CreateErrorState(this.errorMessage);

}

class CreatedPostState extends CreateState {
  final PostModel post;

  CreatedPostState(this.post);

  @override
  List<Object?> get props => [post];
}
