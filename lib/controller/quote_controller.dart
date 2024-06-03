import 'package:pragati_app/headers.dart';

class QuoteController with ChangeNotifier {
  QuoteController() {
    initApi();
    initDataBase();
  }

  List<Quote> allQuotes = [];
  List allAuthor = [];
  List<Quote> favQuotes = [];
  List favQuotesAuthor = [];
  Logger logger = Logger();

  Future<void> initApi() async {
    allQuotes = await QuoteHelper.quoteHelper.getAllQuote();
    logger.i('quotes in ctr: $allQuotes');
    allAuthor = allQuotes
        .where((element) => allAuthor.contains(element.author))
        .toList();
    notifyListeners();
  }

  Future<void> initDataBase() async {
    favQuotes = await QuoteDataBase.quoteDataBase.getAllData();
    logger.i('quotes in ctr: $favQuotes');
    if (favQuotes.isNotEmpty) {
      favQuotesAuthor = favQuotes
          .where((element) => favQuotesAuthor.contains(element.author))
          .toList();
    }
    notifyListeners();
  }

  Future<void> addFavQuoteInDataBase({required Quote quote}) async {
    await QuoteDataBase.quoteDataBase.insetData(quote: quote);
    initDataBase();
  }

  Future<void> deleteQuoteInDataBase({required Quote quote}) async {
    await QuoteDataBase.quoteDataBase.deleteData(quote: quote);
    initDataBase();
  }
}
