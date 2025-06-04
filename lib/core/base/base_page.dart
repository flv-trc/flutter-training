import 'package:flutter/material.dart';

abstract class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  String get title;
  Color get appBarColor;
  bool get automaticallyImplyLeading => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(title),
        backgroundColor: appBarColor,
      ),
      body: SafeArea(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context);
}

mixin BaseScreenMixin<T extends StatefulWidget> on State<T> {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void unfocus() {
    FocusScope.of(context).unfocus();
  }
}