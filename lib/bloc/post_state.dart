import 'package:chopper_app_complete/model/posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DemolistState extends Equatable {
  const DemolistState();
  @override
  List<Object> get props => [];
}

class DemolistInitial extends DemolistState {}

class DemoListLoading extends DemolistState {}

class Demolistfiltered extends DemolistState {
  final List<BuiltPost> filteredposts;

  Demolistfiltered({@required this.filteredposts});
}

class DemoListLoaded extends DemolistState {
  final List<BuiltPost> postlists;

  DemoListLoaded({@required this.postlists});
}

class ErrorListSate extends DemolistState {}
