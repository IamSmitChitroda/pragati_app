import 'package:pragati_app/headers.dart';

Widget listTile({
  required int index,
  required QuoteController mutable,
  required QuoteController unmutable,
  context = BuildContext,
}) {
  Logger logger = Logger();
  Quote quote = mutable.allQuotes[index];
  return Card(
    color: Colors.primaries[index % 18].shade400,
    child: ListTile(
      trailing: IconButton(
        icon: Icon(
          unmutable.allFavQuotes.contains(quote)
              ? Icons.favorite
              : Icons.favorite_border,
          // index < 3 ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () async {
          mutable.allFavQuotes.contains(quote)
              ? await unmutable
                  .deleteQuoteInDataBase(
                    quote: mutable.allQuotes[index],
                  )
                  .then((value) =>
                      logger.i('!ctr obj! ${quote.quote} deleted from fav'))
                  .onError((error, stackTrace) =>
                      logger.e('!ctr obj! ${quote.quote} not deleted from fav'))
              : await unmutable
                  .addFavQuoteInDataBase(
                    quote: mutable.allQuotes[index],
                  )
                  .then((value) =>
                      logger.i('! ctr obj ! ${quote.quote} add in fav'))
                  .onError((error, stackTrace) =>
                      logger.e('! ctr obj ! ${quote.quote} not add in fav'));
        },
      ),
      title: Text(quote.quote),
      subtitle: Text('Author: ${quote.author}'),
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.appRoute.detail_page,
          arguments: mutable.allQuotes[index],
        );
      },
    ),
  );
}
