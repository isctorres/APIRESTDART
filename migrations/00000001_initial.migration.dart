import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("tblAreas", [SchemaColumn("idArea", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("nomArea", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
		database.createTable(SchemaTable("tblAreasCliente", [SchemaColumn("idAreaCliente", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblClientes", [SchemaColumn("idCliente", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("nomCliente", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("dirCliente", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("emailCliente", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("telCliente", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true)]));
		database.createTable(SchemaTable("tblDetallePedido", [SchemaColumn("idDetalle", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("fechaPedido", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false),SchemaColumn("fechaEnvio", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblPedidos", [SchemaColumn("idPedido", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("fechaPedido", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false),SchemaColumn("fechaEnvio", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("tblProductos", [SchemaColumn("idProducto", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("nomProducto", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("existencia", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("reorden", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("comprometidas", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("vigente", ManagedPropertyType.boolean, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("imagen", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("tblAreasCliente", SchemaColumn.relationship("area", ManagedPropertyType.bigInteger, relatedTableName: "tblAreas", relatedColumnName: "idArea", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblAreasCliente", SchemaColumn.relationship("cliente", ManagedPropertyType.bigInteger, relatedTableName: "tblClientes", relatedColumnName: "idCliente", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblDetallePedido", SchemaColumn.relationship("producto", ManagedPropertyType.bigInteger, relatedTableName: "tblProductos", relatedColumnName: "idProducto", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblDetallePedido", SchemaColumn.relationship("pedido", ManagedPropertyType.bigInteger, relatedTableName: "tblPedidos", relatedColumnName: "idPedido", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblPedidos", SchemaColumn.relationship("idCliente", ManagedPropertyType.bigInteger, relatedTableName: "tblClientes", relatedColumnName: "idCliente", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    