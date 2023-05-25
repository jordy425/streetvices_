import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class Productos {
  final int? id;
  final String nombre;
  final int cantidad;
  final double precio;

  const Productos({
    this.id,
    required this.nombre,
    required this.cantidad,
    required this.precio,
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

  static Future<int> insertProductos(Productos productos) async {
    final Database db = await DbHelper.initDb();
    final int result = await db.insert('productos', productos.toMap());
    return result;
  }

  static Future<int> updateProductos(Productos productos) async {
    final Database db = await DbHelper.initDb();
    return await db.update(
      'productos',
      productos.toMap(),
      where: 'id = ?',
      whereArgs: [productos.id],
    );
  }
  
    static Future<int> deleteProductos(int id) async {
    final Database db = await DbHelper.initDb();
    return await db.delete(
      'productos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}