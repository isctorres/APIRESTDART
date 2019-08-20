import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Pedidos.dart';
import 'package:firstapi/model/Productos.dart';

class DetallePedido extends ManagedObject<tblDetallePedido> implements tblDetallePedido{}
class tblDetallePedido{
  @primaryKey
  int idDetalle;

  @Column(indexed: true)
  DateTime fechaPedido;
  
  @Column(indexed: true)
  DateTime fechaEnvio;
  
  @Relate(#detalle)
  Productos producto;

  @Relate(#detalle)
  Pedidos pedido;
}