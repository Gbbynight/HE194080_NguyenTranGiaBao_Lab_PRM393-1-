import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'user.dart';
import '../repositories/user_repository.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  @override
  FutureOr<User?> build() {
    return null; // Mặc định chưa đăng nhập
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await ref.read(userRepositoryProvider).login(email, password);
      if (user != null) {
        state = AsyncValue.data(user); // Đăng nhập thành công
      } else {
        state = AsyncValue.error('Sai email hoặc mật khẩu', StackTrace.current);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}
