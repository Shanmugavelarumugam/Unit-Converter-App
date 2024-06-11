import 'package:flutter/material.dart';

class ConversionBox extends StatefulWidget {
  final String fromUnit;
  final String toUnit;

  const ConversionBox({
    super.key,
    required this.fromUnit,
    required this.toUnit,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ConversionBoxState createState() => _ConversionBoxState();
}

class _ConversionBoxState extends State<ConversionBox> {
  final TextEditingController _valueController = TextEditingController();
  String _result = '';

  void performConversion() {
    double value = double.tryParse(_valueController.text) ?? 0.0;
    double result = 0.0;

    // Perform conversion logic based on fromUnit and toUnit
    switch (widget.fromUnit) {
      // Length conversions
      case 'Meter':
        if (widget.toUnit == 'Feet') {
          result = value * 3.28084;
        } else if (widget.toUnit == 'Kilometer') {
          result = value / 1000;
        } else if (widget.toUnit == 'Centimeter') {
          result = value * 100;
        } else {
          result = value;
        }
        break;
      case 'Feet':
        if (widget.toUnit == 'Meter') {
          result = value / 3.28084;
        } else if (widget.toUnit == 'Kilometer') {
          result = value / 3280.84;
        } else if (widget.toUnit == 'Centimeter') {
          result = value * 30.48;
        } else {
          result = value;
        }
        break;
      case 'Kilometer':
        if (widget.toUnit == 'Meter') {
          result = value * 1000;
        } else if (widget.toUnit == 'Feet') {
          result = value * 3280.84;
        } else if (widget.toUnit == 'Centimeter') {
          result = value * 100000;
        } else {
          result = value;
        }
        break;
      case 'Centimeter':
        if (widget.toUnit == 'Meter') {
          result = value / 100;
        } else if (widget.toUnit == 'Feet') {
          result = value / 30.48;
        } else if (widget.toUnit == 'Kilometer') {
          result = value / 100000;
        } else {
          result = value;
        }
        break;

      // Weight conversions
      case 'Kilogram':
        if (widget.toUnit == 'Pounds') {
          result = value * 2.20462;
        } else if (widget.toUnit == 'Gram') {
          result = value * 1000;
        } else {
          result = value;
        }
        break;
      case 'Pounds':
        if (widget.toUnit == 'Kilogram') {
          result = value / 2.20462;
        } else if (widget.toUnit == 'Gram') {
          result = value * 453.592;
        } else {
          result = value;
        }
        break;
      case 'Gram':
        if (widget.toUnit == 'Kilogram') {
          result = value / 1000;
        } else if (widget.toUnit == 'Pounds') {
          result = value / 453.592;
        } else {
          result = value;
        }
        break;

      // Temperature conversions
      case 'Celsius':
        if (widget.toUnit == 'Fahrenheit') {
          result = (value * 9 / 5) + 32;
        } else {
          result = value;
        }
        break;
      case 'Fahrenheit':
        if (widget.toUnit == 'Celsius') {
          result = (value - 32) * 5 / 9;
        } else {
          result = value;
        }

        break;

      // Area conversions
      case 'Square Meter':
        if (widget.toUnit == 'Acre') {
          result = value * 0.000247105;
        } else if (widget.toUnit == 'Hectare') {
          result = value * 0.0001;
        } else {
          result = value;
        }
        break;
      case 'Acre':
        if (widget.toUnit == 'Square Meter') {
          result = value * 4046.86;
        } else if (widget.toUnit == 'Hectare') {
          result = value * 0.404686;
        } else {
          result = value;
        }
        break;
      case 'Hectare':
        if (widget.toUnit == 'Square Meter') {
          result = value * 10000;
        } else if (widget.toUnit == 'Acre') {
          result = value * 2.47105;
        } else {
          result = value;
        }
        break;

      default:
        result = value;
        break;
    }

    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(
              labelText: 'Value',
              hintText: 'Enter the value',
            ),
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              performConversion();
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: performConversion,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
            child: const Text('Convert'),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Result: $_result',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
