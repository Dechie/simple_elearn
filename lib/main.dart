import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_elearn/providers/course_provider.dart';
import 'package:simple_elearn/providers/theme_provider.dart';
import 'package:simple_elearn/screens/course_list_screen.dart';
import 'package:simple_elearn/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()..loadCourses()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: "Fayida Academy",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: CourseListScreen(),
    );
  }
}
