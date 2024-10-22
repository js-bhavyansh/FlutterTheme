# Flutter Theme Switcher App

This is a simple Flutter app demonstrating the implementation of light and dark theme switching using `Provider` for state management. The app displays a button inside a box, and when tapped, it toggles between light and dark themes.

## Features
- Switch between light and dark themes using a single button tap.
- Uses the `ChangeNotifierProvider` for managing state and theme updates.
- Custom `MyBox` and `MyButton` widgets for easy layout and design.

## Preview
| Light Mode | Dark Mode |
| ------------------- | ------------------- | ------------------- |  
| ![lightMode](https://github.com/user-attachments/assets/1b0cf13c-bf4b-427d-b340-2b8474725079) | ![darkMode](https://github.com/user-attachments/assets/1604062e-6312-4f00-ae92-de718b79c37e) |

## Code Overview

### Main.dart
- The main entry point of the app, which wraps the entire application inside a `ChangeNotifierProvider` to enable theme switching.
```dart
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
```

### ThemeProvider
- A simple class that extends `ChangeNotifier` to handle theme toggling between light and dark modes.
```dart
class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
```

### Light and Dark Themes
- Custom light and dark `ThemeData` defined to set colors for the primary, secondary, and surface.
```dart
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);
```

### HomePage
- The main UI screen, which contains the `MyBox` widget with the theme switch button.
```dart
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
            },
          ),
        ),
      ),
    );
  }
}
```

## Contact

For questions or feedback, please contact [@Bhavyansh03-tech](https://github.com/Bhavyansh03-tech) on GitHub or connect with me on [LinkedIn](https://www.linkedin.com/in/bhavyansh03/).

---
