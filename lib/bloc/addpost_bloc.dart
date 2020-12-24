import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/service/api_service.dart';

import 'addpost_event.dart';
import 'addpost_state.dart';

class AddpostsBloc extends Bloc<AddpostsEvent, AddpostsState> {
  AddpostsBloc() : super(AddpostsInitial());

  @override
  Stream<AddpostsState> mapEventToState(
    AddpostsEvent event,
  ) async* {
    if (event is Addpost) {
      yield AddPostLoading();

      final newPost = BuiltPost(
        (b) => b
          // id is null - it gets assigned in the backend
          ..title = event.title
          ..body = event.body,
      );
      try {
        final response = await PostApiService.create().postPost(newPost);
        String res = response.body.toString();
        print(res);
        yield PostAdded(res: res);
      } catch (_) {
        yield Errorpost();
      }
    } else if (event is ResetPostPage) {
      yield AddpostsInitial();
    }
  }
}
