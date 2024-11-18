import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  // Khai báo các biến
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  // Getter cho các biến
  RxBool get isLoading => _isLoading;
  RxDouble get latitude => _latitude;
  RxDouble get longitude => _longitude;

  @override
  void onInit() {
    // Kiểm tra nếu đang tải và lấy vị trí
    if (_isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  Future<void> getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    // Kiểm tra xem dịch vụ vị trí có được bật không
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      print("Dịch vụ định vị đã bị vô hiệu hóa.");
      return Future.error("Dịch vụ định vị đã bị vô hiệu hóa.");
    }

    // Kiểm tra quyền truy cập vị trí
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      print("Quyền truy cập vị trí bị từ chối vĩnh viễn.");
      return Future.error("Quyền truy cập vị trí bị từ chối vĩnh viễn.");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("Quyền truy cập vị trí bị từ chối.");
        return Future.error("Quyền truy cập vị trí bị từ chối.");
      }
    }

    // Lấy vị trí hiện tại
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _isLoading.value = false;
    } catch (e) {
      print("Failed to get location: $e");
      return Future.error("Failed to get location: $e");
    }
  }
}
