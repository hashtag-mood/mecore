import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: IconButton(
              onPressed: () {
                if (GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == '/today/search') {
                  context.go('/today');
                } else if (GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == '/calendar/search') {
                  context.go('/calendar');
                } else if (GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == '/journal/search') {
                  context.go('/journal');
                }
              },
              icon: Icon(Icons.arrow_back_ios_new_sharp)),
        ),
        body: Center(
          child: Text(
            '검색창',
            style: TextStyle(fontFamily: 'Interop Regular', fontSize: 30),
          ),
        ),
      ),
    );
  }
}
