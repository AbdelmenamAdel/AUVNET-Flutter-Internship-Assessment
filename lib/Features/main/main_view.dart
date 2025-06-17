import 'package:auvnet_internship_task/Features/home/home_view.dart';
import 'package:auvnet_internship_task/core/widgets/custom_nav_bar.dart';
import 'package:auvnet_internship_task/generated/app_images.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomeView(),
            item: ItemConfig(icon: Image.asset(Assets.nav1), title: "Home"),
          ),
          PersistentTabConfig(
            screen: EmptyScreen(text: "Categories"),
            item: ItemConfig(
              icon: Icon(Icons.category_outlined),
              title: "Categories",
            ),
          ),
          PersistentTabConfig(
            screen: EmptyScreen(text: "Deliver"),
            item: ItemConfig(
              icon: Icon(Icons.delivery_dining_outlined),
              title: "Deliver",
            ),
          ),
          PersistentTabConfig(
            screen: EmptyScreen(text: "Cart"),
            item: ItemConfig(
              icon: Icon(Icons.shopping_cart_outlined),
              title: "Cart",
            ),
          ),
          PersistentTabConfig(
            screen: EmptyScreen(text: "Profile"),
            item: ItemConfig(
              icon: Icon(Icons.person_outline),
              title: "Profile",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            CustomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
