import 'package:flutter/material.dart';
import 'package:streetvices_/productos.dart';
import 'package:streetvices_/produt_model.dart';



class ListProductosPage extends StatefulWidget {
  const ListProductosPage({super.key});

  @override
  State<ListProductosPage> createState() => _ListProductosPageState();
}

class _ListProductosPageState extends State<ListProductosPage> {
  List<Productos> productos = [];

  @override
  void initState() {
    loadProductos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('STREET VICES'),
        ),
        body: ListView.separated(
          itemCount: productos.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(productos[index].id!.toString()),
              background: Container(
                color: Colors.red,
                child: const Text(
                  'Eliminar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onDismissed: (direction) async {
                setState(() {
                  productos.removeAt(index);
                });
                await Productos.deleteProductos(productos[index].id!);
              },
              child: ListTile(
                title: Text(productos[index].nombre),
                subtitle: Text("${productos[index].cantidad}"),
                leading: Text("${productos[index].precio}")
              ),
            );
          },
        ));
  }

  void loadProductos() async {
    final ProductosList = await Productos.getProductos();
    setState(() {
      productos = ProductosList;
    });
  }
}
