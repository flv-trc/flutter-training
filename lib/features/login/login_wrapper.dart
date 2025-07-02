import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/features/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';

@RoutePage()
class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginScreen(),
    );
  }
}
