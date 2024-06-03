import 'package:pragati_app/headers.dart';

Widget favPageButton({required BuildContext context}) => IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoute.appRoute.fav_quote_page,
        );
      },
      icon: const Icon(Icons.favorite),
    );
