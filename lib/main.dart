import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_camera/functions/data_model.dart';
import 'package:project_camera/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ImageModelAdapter().typeId)) {
    Hive.registerAdapter(ImageModelAdapter());
  }
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color.fromARGB(255, 9, 106, 121),
            ),
      ),
      home: const SplashScreen(),
    );
  }
}
