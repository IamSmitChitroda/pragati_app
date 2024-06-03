import 'package:pragati_app/headers.dart';

AppBar hpApBar({required context}) => AppBar(
      centerTitle: true,
      actions: [
        themeButton(context),
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        'પ્રગતિ',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
