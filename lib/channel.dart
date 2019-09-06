import 'package:aqueduct/managed_auth.dart';
import 'package:firstapi/model/Usuarios.dart';

import 'firstapi.dart';
import 'controller/AreasController.dart';
import 'controller/ClientesController.dart';
import 'controller/PedidosController.dart';
import 'controller/ProductosController.dart';
import 'controller/AreasClienteController.dart';
import 'controller/ProductosAreasClienteController.dart';
import 'controller/DetallePedidoController.dart';
import 'controller/EmpleadosController.dart';
import 'controller/UsuariosController.dart';


/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class FirstapiChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  
  // Contexto para las conexiones a la base de datos
  ManagedContext context;
  AuthServer authServer;
  
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistenStore = PostgreSQLPersistentStore.fromConnectionInfo("postgres", "p31n3t1n", "127.0.0.1", 5433, "epp_db");
    context = ManagedContext(dataModel,persistenStore);

    final authStorage = ManagedAuthDelegate<Usuarios>(context);
    authServer = AuthServer(authStorage);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route('/auth/token').link(() => AuthController(authServer));

    router.route("/productos[/:idproducto]").link( () => ProductosController(context) ); 
    router.route("/pedidos[/:idpedido]").link( () => PedidosController(context) ); 
    router.route("/clientes[/:idcliente]").link( () => ClientesController(context) ); 
    router.route("/areas[/:idarea]").link( () => AreasController(context) );
    router.route("/areascliente[/:idareacliente]").link( () => AreasClienteController(context) );
    router.route("/productosareascliente[/:idprodareacliente]").link( () => ProductosAreasClienteController(context) );
    router.route("/detallepedido[/:iddetped]").link( () => DetallePedidoController(context) );
    router.route("/empleados[/:idempleado]").link( () => EmpleadosController(context) );
    router.route("/usuarios[/:user/:pwd]").link( () => UsuariosController(context,authServer) );
    
    return router;
  }
}