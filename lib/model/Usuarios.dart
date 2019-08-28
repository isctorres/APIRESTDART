import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Empleados.dart';

class Usuarios extends ManagedObject<tblUsuarios> implements tblUsuarios{}
class tblUsuarios{

  @primaryKey
  int idUsuario;
  @Column(unique: true)
  String nomUsuario;
  String pwdUsuario;

  @Relate(#users)
  Empleados empleado;
}