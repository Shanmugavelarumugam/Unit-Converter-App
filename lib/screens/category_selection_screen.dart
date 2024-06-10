import 'package:flutter/material.dart';
import 'package:unit_converter/screens/conversion_screen.dart';
import '../widgets/category_item.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ? 'Unit Converter App' : 'Units'),
        backgroundColor: Colors.blue,
        leading: selectedCategory == null
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    selectedCategory = null;
                  });
                },
              ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                selectedCategory == null
                    ? 'Select the Category'
                    : 'Select the Unit',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: selectedCategory == null
                  ? _buildMainCategories()
                  : _buildSubCategories(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildMainCategories() {
    return [
      CategoryItem(
        title: 'Length',
        icon: Icons.straighten,
        color: Colors.blue,
        onTap: () {
          setState(() {
            selectedCategory = 'Length';
          });
        },
      ),
      CategoryItem(
        title: 'Weight',
        icon: Icons.fitness_center,
        color: Colors.orange,
        onTap: () {
          setState(() {
            selectedCategory = 'Weight';
          });
        },
      ),
      CategoryItem(
        title: 'Temperature',
        icon: Icons.thermostat,
        color: Colors.red,
        onTap: () {
          setState(() {
            selectedCategory = 'Temperature';
          });
        },
      ),
      CategoryItem(
        title: 'Area',
        icon: Icons.landscape,
        color: Colors.green,
        onTap: () {
          setState(() {
            selectedCategory = 'Area';
          });
        },
      ),
    ];
  }

  List<Widget> _buildSubCategories() {
    switch (selectedCategory) {
      case 'Length':
        return [
          CategoryItem(
            title: 'Meter',
            icon: Icons.straighten,
            color: Colors.blue,
            onTap: () {
              navigateToConversionScreen(context, 'Length', 'Meter');
            },
          ),
          CategoryItem(
            title: 'Kilometer',
            icon: Icons.directions_car,
            color: Colors.green,
            onTap: () {
              navigateToConversionScreen(context, 'Length', 'Kilometer');
            },
          ),
          CategoryItem(
            title: 'Feet',
            icon: Icons.height,
            color: Colors.orange,
            onTap: () {
              navigateToConversionScreen(context, 'Length', 'Feet');
            },
          ),
          CategoryItem(
            title: 'Centimeter',
            icon: Icons.straighten,
            color: Colors.blueAccent,
            onTap: () {
              navigateToConversionScreen(context, 'Length', 'Centimeter');
            },
          ),
        ];
      case 'Weight':
        return [
          CategoryItem(
            title: 'Kilogram',
            icon: Icons.fitness_center,
            color: Colors.orange,
            onTap: () {
              navigateToConversionScreen(context, 'Weight', 'Kilogram');
            },
          ),
          CategoryItem(
            title: 'Pounds',
            icon: Icons.local_fire_department,
            color: Colors.purple,
            onTap: () {
              navigateToConversionScreen(context, 'Weight', 'Pounds');
            },
          ),
          CategoryItem(
            title: 'Gram',
            icon: Icons.scale,
            color: Colors.brown,
            onTap: () {
              navigateToConversionScreen(context, 'Weight', 'Gram');
            },
          ),
        ];
      case 'Temperature':
        return [
          CategoryItem(
            title: 'Celsius',
            icon: Icons.thermostat_outlined,
            color: Colors.teal,
            onTap: () {
              navigateToConversionScreen(context, 'Temperature', 'Celsius');
            },
          ),
          CategoryItem(
            title: 'Fahrenheit',
            icon: Icons.thermostat_rounded,
            color: Colors.red,
            onTap: () {
              navigateToConversionScreen(context, 'Temperature', 'Fahrenheit');
            },
          ),
        ];
      case 'Area':
        return [
          CategoryItem(
            title: 'Square Meter',
            icon: Icons.square_foot,
            color: Colors.blue,
            onTap: () {
              navigateToConversionScreen(context, 'Area', 'Square Meter');
            },
          ),
          CategoryItem(
            title: 'Acre',
            icon: Icons.landscape,
            color: Colors.green,
            onTap: () {
              navigateToConversionScreen(context, 'Area', 'Acre');
            },
          ),
          CategoryItem(
            title: 'Hectare',
            icon: Icons.terrain,
            color: Colors.orange,
            onTap: () {
              navigateToConversionScreen(context, 'Area', 'Hectare');
            },
          ),
        ];
      default:
        return [];
    }
  }

  void navigateToConversionScreen(
      BuildContext context, String category, String unit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConversionScreen(
          category: category,
          unit: unit,
        ),
      ),
    );
  }
}
