import 'package:pragati_app/headers.dart';

class QuoteController with ChangeNotifier {
  QuoteController() {
    initApi();
    initDataBase();
  }

  Logger logger = Logger();
  List<Quote> allQuotes = [];
  List allAuthor = [];
  List<Quote> allFavQuotes = [];
  List allFavQuotesAuthor = [];

  Future<void> initApi() async {
    allQuotes = await QuoteHelper.quoteHelper.getAllQuote();
    logger.i('!API! quotes in ctr: $allQuotes');
    allAuthor = allQuotes
        .where((element) => allAuthor.contains(element.author))
        .toList();
    notifyListeners();
  }

  Future<void> initDataBase() async {
    allFavQuotes = await QuoteDataBase.quoteDataBase.getAllData();
    logger.i('!DB! quotes in ctr: $allFavQuotes');
    if (allFavQuotes.isNotEmpty) {
      allFavQuotesAuthor = allFavQuotes
          .where((element) => allFavQuotesAuthor.contains(element.author))
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
