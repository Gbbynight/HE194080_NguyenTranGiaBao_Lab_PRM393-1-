import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Settingrepository.g.dart';

// Khai báo một Provider tĩnh để chứa instance của SharedPreferences
// Chúng ta sẽ khởi tạo nó trong hàm main() trước khi chạy app
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden in main()');
}

@riverpod
class SettingRepository extends _$SettingRepository {
  static const String _themeKey = 'isDarkMode';
  static const String _languageKey = 'languageCode';

  @override
  void build() {
    // Không cần return gì đặc biệt, class này dùng để chứa các hàm đọc/ghi
  }

  // --- Các hàm GHI (Write) ---

  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(_themeKey, isDarkMode);
  }

  Future<void> saveLanguage(String languageCode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_languageKey, languageCode);
  }

  // --- Các hàm ĐỌC (Read) ---

  bool getTheme() {
    final prefs = ref.read(sharedPreferencesProvider);
    // Nếu chưa lưu thì mặc định trả về false (Light mode)
    return prefs.getBool(_themeKey) ?? false;
  }

  String getLanguage() {
    final prefs = ref.read(sharedPreferencesProvider);
    // Nếu chưa lưu thì mặc định trả về 'en' (Tiếng Anh)
    return prefs.getString(_languageKey) ?? 'en';
  }

  // --- Hàm xóa Setting (Tùy chọn) ---
  
  Future<void> clearSettings() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.remove(_themeKey);
    await prefs.remove(_languageKey);
  }
}
