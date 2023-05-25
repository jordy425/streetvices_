import 'package:flutter/material.dart';

class productos extends StatefulWidget {
  const productos({super.key});

  @override
  State<productos> createState() => _productosState();
}

class _productosState extends State<productos> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STREET VICES'),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            key: _formKey,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            ],
          ),
        )
    );
  }
}