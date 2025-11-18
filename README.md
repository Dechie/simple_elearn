# simple_elearn

## Overview

This is a simple e-learning project written in Flutter. It contains an application with 3 screens, showing
educational content in a clear and organized way.
The first screen shows a list of available screens, and pressing on one of the cards containing that course will lead to the details of that course. The Courses list screen also contains a button on its appbar, that can be used to
toggle light mode and dark mode for the whole application.

The details screen will then show the current progress of the screen, and the list of Units withing the course. The progress of each course is
calculated as specified in the requirements document.

The list of the units in the course, has an expandable sub-list containig teh parts within each course. and pressing on the "start" button of that part will lead to the 3rd screen, the Part detail screen.

The part details screen contains the placeholder ui for the content, which can be filled in the future, and at the bottom of the screen, the mark as completed button can be used to complete that part of the unit.

Since the applicatioin uses provider package for app-wide state-management, the "mark as completed" button will ensure that all the 3 screens of the application will be notified of the updated progress of the course.

- We also have an assets folder in the root folder of the applications, which contains a json file populated with mock data. That data is loaded into the app during startup, and then put into the globally managed state so that all screens can access it and modify it.

## Instructions

- Since the application code includes flutter packages, after downloading the source code, you should run this command

```
flutter pub get
```

After that, you can proceed to build and run the application for your preferred target platform.

## State Management

This application was written using the provider package. Since the app state needed to be managed across the app (for the course related data and also global theme state), and given the small size of the project, using provider package seemed the appropriate choice.

## Project Structure

The project follows a quite simple structure, which can be seen as follows:
lib
```
├── main.dart
├── models
│   ├── course.dart
│   ├── part.dart
│   └── unit.dart
├── providers
│   ├── course_provider.dart
│   └── theme_provider.dart
├── screens
│   ├── course_detail_screen.dart
│   ├── course_list_screen.dart
│   └── part_detail_screen.dart
├── theme
│   └── app_theme.dart
└── widgets
    ├── course_card.dart
    ├── part_item.dart
    ├── progress_bar.dart
    └── unit_tile.dart
```

- The `main.dart` file includes the root MyApp widget and also the integration of top level providers.
- The `models` folder contains data classes for modelling our data
- The `widgets` folder contains widget components we used throughout the app
- The `screens` fodler groups together the 3 screens we have in our project
- The `providers` folder contains the notifiers/providers we have used to manage the app-wide state. These include the course provider which manages course state, and theme provider which toggles dark theme and light theme.
- The `theme` folder contains our theme data we have used for our application. The color-scheme used for our app, for both light and dark modes has been declared in the file within that folder. And then the main.dart file integrates that theme data into the root MyApp widget.
