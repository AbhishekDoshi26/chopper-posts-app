import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AddpostsState extends Equatable {
  const AddpostsState();
  @override
  List<Object> get props => [];
}

class AddpostsInitial extends AddpostsState {}

class AddPostLoading extends AddpostsState {}

class PostAdded extends AddpostsState {
  final String res;

  PostAdded({@required this.res});
}

class Errorpost extends AddpostsState {}
