import 'package:pragati_app/headers.dart';

Widget listTile({
  required int index,
  required String quote,
  required String authorName,
  required mutable,
  context = BuildContext,
}) =>
    Card(
      color: Colors.primaries[index % 18].shade400,
      child: ListTile(
        title: Text(quote),
        subtitle: Text('Author: $authorName'),
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoute.appRoute.detail_page,
            arguments: mutable.allQuotes[index],
          );
        },
      ),
    );
