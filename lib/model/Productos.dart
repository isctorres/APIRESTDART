
import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/DetallePedido.dart';

class Productos extends ManagedObject<tblProductos> implements tblProductos{}
class tblProductos{
  @primaryKey
  int idProducto;

  @Column(unique: true)
  String nomProducto;

  int existencia;
  int reorden;
  int comprometidas;
  bool vigente;
  String imagen;

  ManagedSet<DetallePedido> detalle;
}