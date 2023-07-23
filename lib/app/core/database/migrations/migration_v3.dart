import 'migration_interface.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV3 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute(''' 
      CREATE TABLE teste2(
        id INTEGER PRIMARY KEY AUTOINCREMENT
        )
    ''');
  }

  @override
  void update(Batch batch) {}
}
