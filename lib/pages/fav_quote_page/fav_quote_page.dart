import 'package:pragati_app/headers.dart';

class FavQuotePage extends StatelessWidget {
  const FavQuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Quotes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: mutable.allFavQuotes.length,
          itemBuilder: (context, index) => listTile(
            index: index,
            mutable: mutable,
            unmutable: unmutable,
          ),
        ),
      ),
    );
  }
}
