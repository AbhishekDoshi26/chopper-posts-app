import 'package:chopper/chopper.dart';

import 'package:built_collection/built_collection.dart';
import 'package:chopper_app_complete/model/posts.dart';
import 'package:chopper_app_complete/service/built_value/built_value_converter.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response<BuiltList<BuiltPost>>> getPosts();

  @Get(path: '/{id}')
  Future<Response<BuiltPost>> getPost(@Path('id') int id);

  @Post()
  Future<Response<BuiltPost>> postPost(
    @Body() BuiltPost post,
  );

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services: [_$PostApiService()],
        converter: BuiltValueConverter(),
        interceptors: [
          HttpLoggingInterceptor(),
          //  MobileDataInterceptor()
        ]);
    return _$PostApiService(client);
  }
}
