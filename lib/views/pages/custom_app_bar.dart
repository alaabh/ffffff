// lib/components/custom_app_bar.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/sidebar_popup.dart';
import 'Panier.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final String title;
  final bool showSearch;

  const CustomAppBar({
    Key? key,
    
    this.title = '',
    this.showSearch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => SidebarPopup(),
          );
        },
      ),
      title: Text(title),
      actions: [
        if (showSearch)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChartPage()),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
