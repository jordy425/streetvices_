import 'package:flutter/material.dart';
import 'package:streetvices_/productos.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STREET VICES'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Image.network('', height: 150,),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => productos()));
            }, 
            child: Text('Productos'))
          ],
        ),
      ),
    );
  }
}
