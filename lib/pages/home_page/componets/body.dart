import 'package:pragati_app/headers.dart';

Widget body({
  required QuoteController mutable,
  required QuoteController unmutable,
}) =>
    Padding(
      padding: const EdgeInsets.all(16),
      child: mutable.allQuotes.isNotEmpty
          ? ListView.builder(
              itemCount: mutable.allQuotes.length,
              itemBuilder: (context, index) => listTile(
                index: index,
                mutable: mutable,
                unmutable: unmutable,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
