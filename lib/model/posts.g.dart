// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Posts> _$postsSerializer = new _$PostsSerializer();

class _$PostsSerializer implements StructuredSerializer<Posts> {
  @override
  final Iterable<Type> types = const [Posts, _$Posts];
  @override
  final String wireName = 'Posts';

  @override
  Iterable<Object> serialize(Serializers serializers, Posts object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Posts deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'body':
          result.body = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Posts extends Posts {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String body;

  factory _$Posts([void Function(PostsBuilder) updates]) =>
      (new PostsBuilder()..update(updates)).build();

  _$Posts._({this.userId, this.id, this.title, this.body}) : super._() {
    if (userId == null) {
      throw new BuiltValueNullFieldError('Posts', 'userId');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Posts', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('Posts', 'title');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('Posts', 'body');
    }
  }

  @override
  Posts rebuild(void Function(PostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsBuilder toBuilder() => new PostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Posts &&
        userId == other.userId &&
        id == other.id &&
        title == other.title &&
        body == other.body;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), id.hashCode), title.hashCode),
        body.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Posts')
          ..add('userId', userId)
          ..add('id', id)
          ..add('title', title)
          ..add('body', body))
        .toString();
  }
}

class PostsBuilder implements Builder<Posts, PostsBuilder> {
  _$Posts _$v;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  PostsBuilder();

  PostsBuilder get _$this {
    if (_$v != null) {
      _userId = _$v.userId;
      _id = _$v.id;
      _title = _$v.title;
      _body = _$v.body;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Posts other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Posts;
  }

  @override
  void update(void Function(PostsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Posts build() {
    final _$result =
        _$v ?? new _$Posts._(userId: userId, id: id, title: title, body: body);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
