import 'package:equatable/equatable.dart';

abstract class DemolistEvent extends Equatable {
  const DemolistEvent();
}

class GetDemoList extends DemolistEvent {
  GetDemoList();

  @override
  List<Object> get props => [];
}

class GetFilteredDemoList extends DemolistEvent {
  final String val;
  GetFilteredDemoList(this.val);

  @override
  List<Object> get props => [val];
}
