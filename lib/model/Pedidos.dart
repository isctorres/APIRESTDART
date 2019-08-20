import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Clientes.dart';
import 'package:firstapi/model/DetallePedido.dart';

class Pedidos extends ManagedObject<tblPedidos> implements tblPedidos{}
class tblPedidos{
  @primaryKey
  int idPedido;
  
  @Column(indexed: true)
  DateTime fechaPedido;
  
  @Column(indexed: true)
  DateTime fechaEnvio;
  
  @Relate(#pedido)
  Clientes idCliente;

  ManagedSet<DetallePedido> detalle;
}