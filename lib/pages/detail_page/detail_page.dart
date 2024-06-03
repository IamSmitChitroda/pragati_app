import 'package:pragati_app/headers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Quote quote = ModalRoute.of(context)!.settings.arguments as Quote;

    return Scaffold(
      appBar: AppBar(
        title: Text(quote.quote),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(quote.quote),
            Text('Author: ${quote.author}'),
          ],
        ),
      ),
    );
  }
}
