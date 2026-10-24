
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/photo.dart';
import '../services/photo_api_service.dart';
part 'photo_view_model.g.dart';

@riverpod
class PhotoListViewModel extends _$PhotoListViewModel {
  @override
  Future<List<Photo>> build() {
    final service = PhotoApiService();

    // TODO: Trả về danh sách Photo từ service
    return service.fetchPhotos();
  }
}
