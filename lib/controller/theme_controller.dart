import 'package:pragati_app/headers.dart';

class ThemeController with ChangeNotifier {
  SharedPreferences sharedPreferences;
  bool isDark = false;
  ThemeMode themeMode = ThemeMode.system;

  ThemeController({required this.sharedPreferences}) {
    initTheme();
  }

  void initTheme() {
    isDark = sharedPreferences.getBool('isDark') ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleTheme() {
    isDark = !isDark;
    sharedPreferences.setBool('isDark', isDark);
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
