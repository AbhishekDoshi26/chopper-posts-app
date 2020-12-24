import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'posts.g.dart';

abstract class Posts implements Built<Posts, PostsBuilder> {
  static Serializer<Posts> get serializer => _$postsSerializer;
  int get userId;
  int get id;
  String get title;
  String get body;
  Posts._();
  factory Posts([void Function(PostsBuilder) updates]) = _$Posts;
}
