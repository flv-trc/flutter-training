import 'package:flutter/material.dart';
import 'package:flutter_training/features/login/login.dart';
import 'package:flutter_training/features/login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginScreen(),
    );
  }
}
