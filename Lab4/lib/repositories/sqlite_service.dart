import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../ui/widgets/CourseWidget.dart';

class SqliteService {
  static const String databaseName = "course_database.db";
  static Database? _database;

  // Lấy instance của Database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Khởi tạo Database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Tạo bảng (Table)
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE courses(
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        imageAsset TEXT NOT NULL,
        originalPrice REAL NOT NULL,
        rating REAL,
        reviews INTEGER,
        description TEXT,
        category TEXT,
        isPinned INTEGER
      )
    ''');
  }

  // --- CÁC HÀM CRUD (Thêm, Đọc, Sửa, Xóa) ---

  // Thêm một khóa học mới
  Future<int> insertCourse(Product course) async {
    final db = await database;
    return await db.insert(
      'courses',
      course.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // Ghi đè nếu trùng ID
    );
  }

  // Lấy danh sách tất cả các khóa học
  Future<List<Product>> getCourses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('courses');

    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  // Lấy khóa học theo ID
  Future<Product?> getCourseById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromMap(maps.first);
    }
    return null;
  }

  // Xóa một khóa học
  Future<int> deleteCourse(String id) async {
    final db = await database;
    return await db.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
