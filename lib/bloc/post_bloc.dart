import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';

class DemolistBloc extends Bloc<DemolistEvent, DemolistState> {
  List<BuiltPost> _postList;

  DemolistBloc() : super(DemolistInitial());

  @override
  Stream<DemolistState> mapEventToState(DemolistEvent event) async* {
    if (event is GetFilteredDemoList) {
      yield DemoListLoading();
      final string = event.val;
      //final string = 'qui est esse';
      print('string $string');

      final filteredposts = _postList
          .where((u) => (u.title.toLowerCase().contains(string.toLowerCase()) ||
              u.body.toLowerCase().contains(string.toLowerCase())))
          .toList();
      print('filtered');
      print(filteredposts.length);
      // yield DemoListLoaded(postlists: filteredposts);
      yield Demolistfiltered(filteredposts: filteredposts);
    }
    if (event is GetDemoList) {
      yield DemoListLoading();

      try {
        final response = await PostApiService.create().getPosts();
        _postList = response.body.toList();
        yield DemoListLoaded(postlists: _postList);
      } catch (_) {
        yield ErrorListSate();
      }
    }
  }
}
