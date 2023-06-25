import 'migration_interface.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV3 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute(''' 
      CREATE TABLE teste2(id INTEGER NOT NULL AUTOINCREMENT)
    ''');
  }

  @override
  void update(Batch batch) {}
}
