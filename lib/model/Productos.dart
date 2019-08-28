
import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/DetallePedido.dart';
import 'package:firstapi/model/ProductoAreasCliente.dart';

class Productos extends ManagedObject<tblProductos> implements tblProductos{}
class tblProductos{
  @primaryKey
  int idProducto;

  @Column(unique: true)
  String nomProducto;

  double costo;
  double precio;
  int existencia;
  int reorden;
  int comprometidas;
  bool vigente;
  String imagen;

  ManagedSet<DetallePedido> detalle;
  ManagedSet<ProductoAreasCliente> prodareacte;
}