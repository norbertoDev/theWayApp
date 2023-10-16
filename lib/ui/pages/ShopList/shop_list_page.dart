import 'package:flutter/material.dart';

class ShopListPage extends StatelessWidget {
  const ShopListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shop list page"),
      ),
      body: const Center(
        child: Text("Esto es La lista de la compra."),
      ),
    );
  }
}
