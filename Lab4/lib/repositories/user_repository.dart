import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository();
}

class UserRepository {
  // Giả lập gọi API đăng nhập
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Đăng nhập thành công nếu nhập đúng tài khoản mẫu (hoặc bất kỳ email nào kèm pass 123456)
    if (email.isNotEmpty && password == '123456') {
      return User(id: 'u1', email: email, name: 'Học viên');
    }
    return null;
  }
}
