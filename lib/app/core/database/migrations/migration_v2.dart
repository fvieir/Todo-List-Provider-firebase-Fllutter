import 'migration_interface.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV2 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute(''' 
      CREATE TABLE teste(id INTEGER NOT NULL AUTOINCREMENT)
    ''');
  }

  @override
  void update(Batch batch) {}
}
