import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_way_app/ui/blocs/navigation/nav_bar_items.dart';
import 'package:the_way_app/ui/blocs/navigation/navigation_cubit.dart';
import 'package:the_way_app/ui/components/FooterBar/footer_bar.dart';
import 'package:the_way_app/ui/pages/Home/home_page.dart';

import 'ShopList/shop_list_page.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" root screen"),
      ),
      bottomNavigationBar: FooterBar(),
      body: const HomePage(),
    );
  }
}
