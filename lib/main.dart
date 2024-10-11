import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Product Grid',
      builder: (context, widget) {
        return MaxWidthBox(
          maxWidth: 1200,
          child: widget!,
        );
      },
      home: ResponsiveBreakpoints.builder(
        breakpoints: [
          Breakpoint(start: 0, end: 800, name: MOBILE),
          Breakpoint(start: 801, end: 1000, name: TABLET),
          Breakpoint(start: 1001, end: double.infinity, name: DESKTOP),
        ],
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> products = List.generate(120, (index) => "Product $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Product Grid'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveValue<int>(
            context,
            defaultValue: 1,
            conditionalValues: [
              // Condition.between(start: 0, end: 800, value: 1),
              // Condition.between(start: 801, end: 1000, value: 4),
              // Condition.between(start: 1001, end: 2000, value: 6),
              Condition.equals(name: MOBILE, value: 1),
              Condition.equals(name: TABLET, value: 4),
              Condition.equals(name: DESKTOP, value: 6),
            ],
          ).value,
          childAspectRatio: 1,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(productName: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;

  const ProductCard({required this.productName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return isMobile
        ? _buildMobileLayout()
        : _buildGridLayout();
  }

  Widget _buildMobileLayout() {
    return Row(
      children: [
        FlutterLogo(size: 50),
        SizedBox(width: 10),
        Expanded(child: Text(productName)),
      ],
    );
  }

  Widget _buildGridLayout() {
    return Column(
      children: [
        Expanded(child: FlutterLogo()),
        SizedBox(height: 10),
        Text(productName),
      ],
    );
  }
}
