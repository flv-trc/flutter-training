import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_training/core/redux/app_state.dart';
import 'package:flutter_training/core/redux/reducer.dart';
import 'package:flutter_training/features/dashboard/dashboard_workouts/dashboard_card_list.dart';
import 'package:flutter_training/mock/mock_workouts.dart';
import 'package:redux/redux.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {

    final store = Store<AppState>(
      appReducer,
      initialState: AppState(workouts: mockWorkouts),
    );

    return Widgetbook.material(
      directories: [
        WidgetbookFolder(
          name: 'Workout Components',
          children: [
            WidgetbookComponent(
              name: 'WorkoutCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'WorkoutCardList',
                  builder: (context) => StoreProvider<AppState>(
                    store: store,
                    child: Center(
                      child: WorkoutCardList(workouts: mockWorkouts, title: 'WorkoutCardList', fillScreen: false)
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Filled WorkoutCardList',
                  builder: (context) => StoreProvider<AppState>(
                    store: store,
                    child: Center(
                      child: WorkoutCardList(workouts: mockWorkouts, title: 'WorkoutCardList', fillScreen: true)
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
