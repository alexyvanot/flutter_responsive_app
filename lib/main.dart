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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: ResponsiveValue<int>(
                  context,
                  defaultValue: 1,
                  conditionalValues: [
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
          ),
          Footer(), // Ajout du footer ici
        ],
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
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: isMobile
        ? _buildMobileLayout()
        : _buildGridLayout(),
    );
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

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: isMobile 
          ? _buildMobileFooter()
          : _buildDesktopFooter(),
    );
  }

  Widget _buildMobileFooter() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.home),
        // SizedBox(width: 16),
        Icon(Icons.info),
        // SizedBox(width: 16),
        Icon(Icons.contact_mail),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Bouziane Incorporation', style: TextStyle(fontSize: 16)),
        Row(
          children: [
            Text('About', style: TextStyle(fontSize: 16)),
            SizedBox(width: 16),
            Text('Contact', style: TextStyle(fontSize: 16)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.home),
            SizedBox(width: 16),
            Icon(Icons.info),
            SizedBox(width: 16),
            Icon(Icons.contact_mail),
          ],
        ),
      ],
    );
  }
}
