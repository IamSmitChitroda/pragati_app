import 'package:pragati_app/headers.dart';
import 'package:pragati_app/pages/home_page/componets/fav_page_button.dart';

AppBar hpApBar({required context}) => AppBar(
      centerTitle: true,
      actions: [
        favPageButton(context: context),
        themeButton(context: context),
      ],
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        'પ્રગતિ',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
