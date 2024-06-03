import 'package:pragati_app/headers.dart';

enum QuoteTable { id, quote, author }

class QuoteDataBase {
  QuoteDataBase._();
  static final QuoteDataBase quoteDataBase = QuoteDataBase._();

  late Database database;
  Logger logger = Logger();
  String db_name = 'pragati_db.db';
  String table_name = 'quote_table';
  String sql = 'Query here';

  Future<void> initDataBase() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      "$dbPath/$db_name",
      version: 1,
      onCreate: (db, version) {
        sql =
            "CREATE TABLE $table_name(${QuoteTable.id.name} INTEGER PRIMARY KEY, ${QuoteTable.quote.name} TEXT, ${QuoteTable.author.name} TEXT);";
        db
            .execute(sql)
            .then(
              (value) => logger.i('table created'),
            )
            .onError(
              (error, stackTrace) =>
                  logger.e('Table not created\n Error: $error'),
            );
      },
      onUpgrade: (version, v1, v2) {},
      onDowngrade: (version, v1, v2) {},
    );
  }

  Future<void> insetData({required Quote quote}) async {
    await database
        .insert(
          table_name,
          quote.toMap(),
        )
        .then((value) => logger.i('${quote.quote} inserted'))
        .onError(
            (error, stackTrace) => logger.e('${quote.quote} insertion error'));
  }

  Future<void> deleteData({required Quote quote}) async {
    await database
        .delete(
          table_name,
          where: '${QuoteTable.id.name} = ?',
          whereArgs: [quote.id],
        )
        .then((value) => logger.i('${quote.quote} deleted'))
        .onError(
            (error, stackTrace) => logger.e('${quote.quote} deletion error'));
  }

  Future<List<Quote>> getAllData() async {
    List<Map<String, dynamic>> data = await database.query(table_name);
    return data.map((e) => Quote.fromJson(e)).toList();
  }
}
