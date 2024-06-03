import 'package:pragati_app/headers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await QuoteDataBase.quoteDataBase.initDataBase();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeController(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider(
          create: (_) => QuoteController(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
