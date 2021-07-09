import 'package:flutter/material.dart';
import 'package:post_data_to_server/constants/post_text_styles.dart';
import 'package:post_data_to_server/services/http_service.dart';
import 'package:post_data_to_server/models/user_models.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post Your Post ',
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: jobTypeController,
              ),
              const SizedBox(
                height: 30.0,
              ),
              _user == null
                  ? Container()
                  : Text(
                      "The user created ${_user.name}, ${_user.id} at this time ${_user.createdAt.toString()}",
                      style: xUserNameTextStyle,
                    ),
              const SizedBox(
                height: 20,
              ),
             _user == null ? Container() : Text(
                'We need to ${_user.job} at this time',
                style: xPosetedJobTypeTextStyle,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobType = jobTypeController.text;

          final UserModel user = await createUser(name, jobType);

          setState(() {
            _user = user;
          });
        },
        child: const Text('Add'),
      ),
    );
  }
}
