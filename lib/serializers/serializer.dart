import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper_app_complete/model/posts.dart';
part 'serializer.g.dart';

@SerializersFor([Posts])
final Serializers serializers = _$serializers;

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
