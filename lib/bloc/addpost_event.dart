import 'package:equatable/equatable.dart';

abstract class AddpostsEvent extends Equatable {
  const AddpostsEvent();
}

class ResetPostPage extends AddpostsEvent {
  ResetPostPage();
  @override
  List<Object> get props => [];
}

class Addpost extends AddpostsEvent {
  final String title;
  final String body;
  Addpost(this.title, this.body);

  @override
  List<Object> get props => [title, body];
}
