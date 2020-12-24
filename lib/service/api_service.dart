import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_app_complete/model/posts.dart';

import 'built_value/built_value_converter.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class ApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<Posts>>> getPosts();

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$ApiService(),
      ],
      converter: BuiltValueConverter(),
    );
    return _$ApiService(client);
  }
}
