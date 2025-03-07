import 'package:bookworm/data/exceptions/app_exception.dart';
import 'package:bookworm/data/network/base_api.dart';
import 'package:http/http.dart';

class NetworkApi extends BaseApi {
  @override
  Future<String> getRequest({
    required Uri uri,
    Duration? timeLimit,
  }) async {
    try {
      Response response = await get(uri).timeout(
          timeLimit ??
              Duration(
                seconds: 20,
              ), // Default timeout duration
          onTimeout: () => throw TimeoutException());
      return _getResponseBody(response: response);
    } catch (e) {
      return Future.error(e);
    }
  }

  String _getResponseBody({required Response response}) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      case 400:
        throw BadRequestException();
      case 401:
        throw ForbiddenException();
      case 403:
        throw ForbiddenException();
      case 404:
        throw ResourceNotFoundException();
      default:
        throw AppException(message: "Something went wrong!");
    }
  }
}
