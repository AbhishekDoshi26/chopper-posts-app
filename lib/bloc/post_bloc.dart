import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/service/api_service.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitialState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Fetch) {
      yield PostLoadingState();
      print('Data Loading');
      final Response<BuiltList<Posts>> response =
          await ApiService.create().getPosts();
      print('Data Fetched');
      yield PostLoadedState(post: response);
    }
  }
}
