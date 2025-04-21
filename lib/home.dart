import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() {
    return _CurrencyConverterState();
  }
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double convertedValue = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint('build called');

    @override
    // ignore: unused_element
    void initState() {
      super.initState();
      debugPrint('initState called');
    }

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(22, 223, 69, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '00000',
              style: TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w100,
                letterSpacing: -28,
                color: Color.fromRGBO(200, 240, 30, 1),
              ),
            ),

            Text(
              '₹$convertedValue',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  labelStyle: TextStyle(color: Colors.red),
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.green,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: border,
                  enabledBorder: InputBorder.none,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    convertedValue =
                        double.parse(textEditingController.text) * 81;
                  });
                },

                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Color.fromRGBO(22, 223, 69, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Convert ', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
