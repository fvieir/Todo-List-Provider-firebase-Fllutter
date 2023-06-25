import 'package:todo_list_with_provider_firebase/app/core/database/migrations/migration_interface.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/migrations/migration_v1.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/migrations/migration_v3.dart';

import 'migrations/migration_v2.dart';

class SqliteMigrationFactory {
  List<IMigration> getCreateMigration() => [
        MigrationV1(),
        MigrationV2(),
        MigrationV3(),
      ];

  List<IMigration> getUpdateMigration(int version) {
    final migration = <IMigration>[];

    if (version == 1) {
      migration.add(MigrationV2());
      migration.add(MigrationV3());
    }

    if (version == 2) {
      migration.add(MigrationV3());
    }

    return migration;
  }
}
