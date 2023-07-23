import 'migration_interface.dart';
import 'package:sqflite/sqflite.dart';

class MigrationV2 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute(''' 
      CREATE TABLE teste(
        id INTEGER PRIMARY KEY AUTOINCREMENT
        )
    ''');
  }

  @override
  void update(Batch batch) {}
}
