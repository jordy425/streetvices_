import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Productos {
  final int? id;
  final String nombre;
  final int cantidad;
  final double precio;
  const Productos({
    this.id,
    required String this.nombre,
    required int this.cantidad,
    required double this.precio,
  });

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'nombre':nombre,
      'cantidad':cantidad,
      'precio':precio,
    };
  }

  @override
  String toString(){
    return 'Productos{id: $id, nombre: $nombre, cantidad: $cantidad, precio: $precio}';
  }

  static Future<List<Productos>> getProductos() async {
    final Database db = await DbHelper.initDb();
    final List<Map<String, dynamic>> maps = await db.query('productos');
    return List.generate(maps.length, (i) {
      return Productos(
        id: maps[i]['id'], 
        nombre: maps[i]['nombre'], 
        cantidad: maps[i]['cantidad'], 
        precio: maps[i]['precio'],
      );
    });
  }

}