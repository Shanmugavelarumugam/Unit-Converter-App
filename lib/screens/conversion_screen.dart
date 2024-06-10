import 'package:flutter/material.dart';
import 'package:unit_converter/widgets/conversion_box.dart';

class ConversionScreen extends StatefulWidget {
  final String category;
  final String unit;

  const ConversionScreen({
    super.key,
    required this.category,
    required this.unit,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ConversionScreenState createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  late List<String> _availableUnits;

  String? _selectedFromUnit;
  String? _selectedToUnit;

  @override
  void initState() {
    super.initState();
    _selectedFromUnit = widget.unit;
    _selectedToUnit = widget.unit;
    _availableUnits = _getAvailableUnits(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedFromUnit,
                decoration: const InputDecoration(labelText: 'From'),
                items: _availableUnits
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedFromUnit = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedToUnit,
                decoration: const InputDecoration(labelText: 'To'),
                hint: const Text('Select unit'),
                items: _availableUnits
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedToUnit = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              if (_selectedToUnit != null)
                ConversionBox(
                  fromUnit: _selectedFromUnit!,
                  toUnit: _selectedToUnit!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _getAvailableUnits(String category) {
    switch (category) {
      case 'Length':
        return ['Meter', 'Kilometer', 'Centimeter', 'Feet'];
      case 'Weight':
        return ['Kilogram', 'Gram', 'Pounds'];
      case 'Temperature':
        return ['Celsius', 'Fahrenheit'];
      case 'Area':
        return ['Square Meter', 'Acre', 'Hectare'];
      default:
        return [];
    }
  }
}
