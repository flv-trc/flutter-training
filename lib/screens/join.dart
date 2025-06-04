import 'package:flutter/material.dart';
import 'package:flutter_training/core/base/base_page.dart';

class JoinScreen extends BaseScreen {
  const JoinScreen({super.key});

  @override
  Color get appBarColor => Colors.white;
  @override
  String get title => "Join Screen";

  @override
  Widget buildBody(BuildContext context) {
    return Center(child: Text("Join Screen"));
  }
}
