import 'package:pragati_app/headers.dart';
import 'package:flutter/cupertino.dart';

Widget themeButton(context) => IconButton(
      icon: Icon(
        Provider.of<ThemeController>(context).isDark
            ? Icons.sunny
            : CupertinoIcons.moon_fill,
      ),
      onPressed: () {
        Provider.of<ThemeController>(context, listen: false).toggleTheme();
      },
    );
