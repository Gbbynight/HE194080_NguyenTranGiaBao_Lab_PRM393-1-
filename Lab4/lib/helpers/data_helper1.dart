import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataHelper1 {
  // Tên và phiên bản của Database
  static const _databaseName = "MyDatabase1.db";
  static const _databaseVersion = 1;

  // Tên bảng và các cột
  static const table = 'my_table';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnData = 'data';

  // Khởi tạo Singleton pattern để đảm bảo chỉ có 1 kết nối database được mở
  DataHelper1._privateConstructor();
  static final DataHelper1 instance = DataHelper1._privateConstructor();

  static Database? _database;

  // Trả về instance của database, nếu chưa có thì khởi tạo
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Mở database, tạo file nếu chưa tồn tại
  Future<Database> _initDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _databaseName);
    
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code để tạo bảng mới
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnData TEXT NOT NULL
          )
          ''');
  }

  // --- CÁC HÀM TIỆN ÍCH CHUẨN (Helper Methods) ---

  // Chèn một dòng (insert)
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Lấy tất cả dữ liệu (query all)
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Lấy dữ liệu theo ID
  Future<List<Map<String, dynamic>>> queryRowById(int id) async {
    Database db = await instance.database;
    return await db.query(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Lấy tổng số lượng dòng
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // Cập nhật dữ liệu (update)
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Xóa dữ liệu (delete)
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
