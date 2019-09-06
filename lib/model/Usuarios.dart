import 'package:aqueduct/managed_auth.dart';
import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Empleados.dart';

class Usuarios extends ManagedObject<tblUsuarios> implements tblUsuarios, ManagedAuthResourceOwner<tblUsuarios>{
  @Serialize(input: true, output: false)
  String password;
}

class tblUsuarios extends ResourceOwnerTableDefinition{

  @Relate(#users)
  Empleados empleado;

}