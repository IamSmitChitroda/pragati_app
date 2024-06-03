import 'package:pragati_app/headers.dart';
import 'package:http/http.dart' as http;

class QuoteHelper {
  QuoteHelper._();
  static final QuoteHelper quoteHelper = QuoteHelper._();

  Logger logger = Logger();
  String quote_api = 'https://dummyjson.com/quotes';

  Future<List<Quote>> getAllQuote() async {
    List<Quote> allData = [];

    http.Response response = await http.get(Uri.parse(quote_api));
    if (response.statusCode == 200) {
      logger.i('response.statusCode: ${response.statusCode}');
      List data = jsonDecode(response.body)['quotes'];
      allData = data
          .map(
            (e) => Quote.fromJson(
              e,
            ),
          )
          .toList();
    } else {
      logger.e('status code: ${response.statusCode} \nerror: ${response.body}');
    }

    return allData;
  } // getAllQuote
} // QuoteHelper
