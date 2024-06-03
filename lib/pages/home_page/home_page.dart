import 'package:pragati_app/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteController mutable = Provider.of<QuoteController>(context);
    QuoteController unmutable =
        Provider.of<QuoteController>(context, listen: false);
    return Scaffold(
      appBar: hpApBar(context: context),
      body: body(mutable: mutable, unmutable: unmutable),
    );
  }
}
