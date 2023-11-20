import 'package:flutter/material.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              child: Text('Purchase'),
              onPressed: () {
                _purchase();
              },
            ),
            FilledButton(
              child: Text('Request location permission'),
              onPressed: () {
                _requestLocationPermission();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _purchase() async {
    final clientApplicationKey = "<Ключ для клиентских приложений>";
    final amount = Amount(value: 999.9, currency: Currency.rub);
    final shopId = "<Идентификатор магазина в ЮKassa)>";

    final testModeSettings = TestModeSettings(true, 5, Amount(value: 999, currency: Currency.rub), false);
    final settings = TokenizationSettings(PaymentMethodTypes.bankCard);

    final tokenizationModuleInputData = TokenizationModuleInputData(
      clientApplicationKey: clientApplicationKey,
      title: "Космические объекты",
      subtitle: "Комета повышенной яркости, период обращения — 112 лет",
      amount: amount,
      shopId: shopId,
      savePaymentMethod: SavePaymentMethod.on,
      testModeSettings: testModeSettings,
      tokenizationSettings: settings,
    );

    final result = await YookassaPaymentsFlutter.tokenization(tokenizationModuleInputData);
  }

  Future<void> _requestLocationPermission() async {
    await Permission.location.request();
  }

}
