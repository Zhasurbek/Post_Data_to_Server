import 'package:http/http.dart' as http;
import 'package:post_data_to_server/models/user_models.dart';

Future<UserModel> createUser(String name, String jobType) async {
  const String apiUrl = 'https://reqres.in/api/users';

  http.Response response = await http.post(apiUrl, body: {
    "name": name,
    "job": jobType,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}
