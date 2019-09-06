import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firstapi/firstapi.dart';
import 'package:firstapi/model/Usuarios.dart';

class UsuariosController extends ResourceController{
  UsuariosController(this.context,this.authServer);
  
  final ManagedContext context;
  final AuthServer authServer;

  @Operation.post()
  Future<Response> createUser(@Bind.body() Usuarios user) async {
    // Check for required parameters before we spend time hashing
    if (user.username == null || user.password == null) {
      return Response.badRequest(
        body: {"error": "username and password required."});
    }

    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);

    return Response.ok(await Query(context, values: user).insert());
  }

  @Operation.get('user','pwd')
  Future<Response> loginUser(@Bind.path('user') String usuario, @Bind.path('pwd') String pwd ) async {
    
    final clientID = "com.patm.epp";
    final body = "username=$usuario&password=$pwd&grant_type=password";

    // Note the trailing colon (:) after the clientID.
    // A client identifier secret would follow this, but there is no secret, so it is the empty string.
    final clientCredentials = Base64Encoder().convert("$clientID:".codeUnits);

    final response = await http.post(
        "http://localhost:8888/auth/token",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Basic $clientCredentials"
        },
        body: body
      );
    
    //print(response.body);
    //var json = jsonEncode(response.body);
    return Response.ok(response.body);
  }

}