import 'package:flutter_application_1/common/encryption_util.dart';
import 'package:flutter_application_1/core/static_variables.dart';
import 'package:flutter_application_1/database/Tables/tables.dart';
import 'package:path/path.dart';
import 'package:sqflite_sqlcipher/sqflite.dart'; //inbuild path safety package

class DatabaseHelper {
  //singleton instance for avoiding opening multiple db connections accidently
  //static final DatabaseHelper instance = DatabaseHelper()._internal();

  static final DatabaseHelper instance = DatabaseHelper._internal();
  //constructor
  DatabaseHelper._internal();

  //private db var
  //Stored statically so the same DB instance is reused
  static Database? _database;

//Used whenever DB is needed in the app
  Future<Database> get database async {
    print("DB Helper Called");

    //if database already initiated then return it
    // ! in return stattement promise this value is not null at this point.
    if (_database != null) return _database!;
    //if not initialized
    _database = await _initDB();

    return _database!;
  }

//Methid to initialize database
//handling path creation and db opening

  Future<Database> _initDB() async {
    // Gets default database directory for the platform
    // Example: in phone Android → /data/user/0/<package>/databases/
    final dbPath = await getDatabasesPath();

    //joins directory path with database file name safety
    final path = join(dbPath, StaticVariables.DbName);

    //Encrypted Password
    final dbPassword = EncryptionUtil.getHashValue(StaticVariables.dbKey!);

    //opening db or creates the db connection if dosent exist

    return await openDatabase(
      path,

      //password encryption
      password: dbPassword,
      //DB version
      version: StaticVariables.DbVersion,

      onCreate: _onCreate,

      onUpgrade: _onUpgrade,
    );
  }

  //Called if db created for 1st time
  //use to create DB

  Future<void> _onCreate(Database db, int version) async {
    //Execute eaw sql
    print("Running table creator         -----------------------");
    await db.execute(DbTables.createUserTable);
    // LEAD DETAILS TABLE
    try {
      await db.execute(DbTables.ceadDetails);
    } catch (e) {
      print("exception catched :  $e");
    }

    // ACTIVITY TRACKER TABLE
    await db.execute(DbTables.lmsLeadActivityTracker);
  }

  //if
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //await db.execute(DbTables.dropUserTable);
    //await db.execute(DbTables.LeadDetails);
    //await db.execute(DbTables.LMSLeadActivityTracker);
    //await _onCreate(db, newVersion);

    await db.execute(DbTables.dropUserTable);
    await db.execute(DbTables.dropLeadDetails);
    await db.execute(DbTables.dropLMSLeadActivityTracker);

    await _onCreate(db, newVersion);
  }
}
