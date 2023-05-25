import 'package:flutter/material.dart';

import 'listarproductos.dart';

class productos extends StatefulWidget {
  const productos({super.key});

  @override
  State<productos> createState() => _productosState();
}

class _productosState extends State<productos> {
  final _formKey = GlobalKey<FormState>();
  
  final _controllerNombre = TextEditingController();
  final _controllerCantidad = TextEditingController();
  final _controllerPrecio = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('STREET VICES'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _controllerNombre,
              decoration: InputDecoration(label: Text("Nombre")),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa lo solicitado';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _controllerCantidad,
              decoration: InputDecoration(label: Text("Cantidad")),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa lo solicitado';
                }
                return null;
              },
            ),
            
            TextFormField(
              controller: _controllerPrecio,
              decoration: InputDecoration(label: Text("Precio")),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa lo solicitado';
                }
                return null;
              },
            ),
 
            ElevatedButton( 
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListProductosPage()));
                }
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}