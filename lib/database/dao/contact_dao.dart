import 'package:neobank/database/app_database.dart';
import 'package:neobank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static final String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return _toList(result);
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  Future<int> update(Contact contact) async {
    final Database db = await createDatabase();
    final Map<String, dynamic> contactMap = _toMap(contact);
    return db.update(
      _tableName,
      contactMap,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await createDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
