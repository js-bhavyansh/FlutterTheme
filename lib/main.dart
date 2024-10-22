import 'package:flutter/material.dart';
import 'package:flutter_theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // Creating instance
    ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData
      // darkTheme: darkMode,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MyBox(
            color: Theme.of(context).colorScheme.primary,
            child: MyButton(
                color: Theme.of(context).colorScheme.secondary,
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                }
            )
        ),
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Color? color;
  final Widget? child;

  const MyBox({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
          ),
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(50),
      child: child,
    );
  }
}

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;

  const MyButton({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(25),
        child: const Center(
          child: Text('TAP'),
        ),
      ),
    );
  }
}
