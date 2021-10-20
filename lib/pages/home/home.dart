import 'package:citytaxi/models/user.dart';
import 'package:citytaxi/pages/auth/auth_page.dart';
import 'package:citytaxi/pages/map/map_view.dart';
import 'package:citytaxi/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ValueListenableBuilder<User?>(
        valueListenable: UserRepository.instance!.userNotifier,
        builder: (context, value, child) {
          if (value != null) {
            return Builder(
              builder: (context) {
                if (!value.isVerified!) {
                  return AuthPage(page: 2, uid: value.uid);
                } else {
                  return MapView();
                }
              },
            );
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
