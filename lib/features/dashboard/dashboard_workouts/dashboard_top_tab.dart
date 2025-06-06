import 'package:flutter/material.dart';
import 'package:flutter_training/features/dashboard/dashboard_workouts/dashboard_collection_list.dart';

import '../../../resources/images.dart';
import '../../workout/workout_model.dart';
import '../models/collection_model.dart';
import 'dashboard_card_list.dart';

enum DashboardTopTab {
  forYou("For You"),
  browse("Browse"),
  collections("Collections"),
  plans("Plans");

  final String label;
  const DashboardTopTab(this.label);

  Widget get widget {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  Widget get tabBarContent {
    var workouts = [
      WorkoutModel(
        name: "Morning Yoga",
        description: "Start your day with a refreshing yoga session.",
        isFavorite: false,
        id: '',
        duration: 3,
        exercises: [],
        difficultyLevel: 'Intermediate',
        imageUrl: Images.workouts1,
      ),
      WorkoutModel(
        name: "Evening Cardio",
        description: "Boost your energy with an evening cardio workout.",
        isFavorite: true,
        id: '',
        duration: 5,
        exercises: [],
        difficultyLevel: 'Easy',
        imageUrl: Images.workouts2,
      ),
      WorkoutModel(
        name: "Strength Training",
        description: "Build muscle with this strength training routine.",
        isFavorite: false,
        id: '',
        duration: 6,
        exercises: [],
        difficultyLevel: 'Intermediate',
        imageUrl: Images.workouts3,
      ),
      WorkoutModel(
        name: "HIIT Blast",
        description: "High-Intensity Interval Training for quick results.",
        isFavorite: true,
        id: '',
        duration: 3,
        exercises: [],
        difficultyLevel: 'Advanced',
        imageUrl: Images.workouts4,
      ),
      WorkoutModel(
        name: "Pilates Core",
        description: "Strengthen your core with Pilates exercises.",
        isFavorite: false,
        id: '',
        duration: 4,
        exercises: [],
        difficultyLevel: 'Beginner',
        imageUrl: Images.workouts5,
      ),
    ];

    var collections = [
      CollectionModel(
        id: '1',
        name: "Yoga for Beginners",
        workouts: workouts,
        imageUrl: Images.workouts3, 
        difficultyLevel: 'All levels',
      ),
      CollectionModel(
        id: '2',
        name: "Cardio Blast",
        workouts: workouts,
        imageUrl: Images.workouts4, 
        difficultyLevel: 'Intermediate',
      ),
      CollectionModel(
        id: '3',
        name: "Strength & Conditioning",
        workouts: workouts,
        imageUrl: Images.workouts5, 
        difficultyLevel: 'Advanced',
      ),
    ];

    switch (this) {
      case DashboardTopTab.forYou:
        return WorkoutCardList(
          title: "New Workouts",
          workouts: workouts,
          fillScreen: true,
        );
      case DashboardTopTab.browse:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WorkoutCardList(
                title: "Top Picks for You",
                workouts: workouts,
                fillScreen: false,
              ),
              CollectionCardList(collections: collections)
            ],
          ),
        );
      case DashboardTopTab.collections:
        return Center(child: Text("Collections Content"));
      case DashboardTopTab.plans:
        return Center(child: Text("Plans Content"));
    }
  }
}
