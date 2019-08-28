import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("tblProductosAreasCliente", [SchemaColumn("idProdAreaCliente", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("consumo", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("tblProductosAreasCliente", SchemaColumn.relationship("areascliente", ManagedPropertyType.bigInteger, relatedTableName: "tblAreasCliente", relatedColumnName: "idAreaCliente", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("tblProductosAreasCliente", SchemaColumn.relationship("producto", ManagedPropertyType.bigInteger, relatedTableName: "tblProductos", relatedColumnName: "idProducto", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    