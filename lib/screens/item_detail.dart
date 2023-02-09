import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetail extends StatelessWidget{
  final String id;
  final String name;
  const ItemDetail({super.key, required this.id, required this.name});
  @override
  Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Item Detail')),),
      body: Container(
        height: 50,
        width: 50,
        child: Text('Hello World'),
      ),
    ),
  );
  }

}