import 'package:neobank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String path = join(await getDatabasesPath(), 'neobank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
  );
}
