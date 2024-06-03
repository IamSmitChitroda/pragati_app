import 'package:pragati_app/headers.dart';

Widget body({required mutable, required unmutable}) => Padding(
      padding: const EdgeInsets.all(16),
      child: mutable.allQuotes.isNotEmpty
          ? ListView.builder(
              itemCount: mutable.allQuotes.length,
              itemBuilder: (context, index) => listTile(
                index: index,
                quote: mutable.allQuotes[index].quote,
                authorName: mutable.allQuotes[index].author,
                mutable: mutable,
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
