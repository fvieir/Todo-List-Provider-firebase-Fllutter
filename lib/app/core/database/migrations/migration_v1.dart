import 'migration_interface.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV1 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute(''' 
      CREATE TABLE todo(
        id INTEGER PRIMARY KEY AUTOINCREMET,
        descricao VARCHAR(500) NOT NULL,
        data_hora DATETIME,
        finalizado INTEGER
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}
