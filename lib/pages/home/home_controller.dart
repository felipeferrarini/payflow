import 'package:get/get.dart';

class HomeController extends GetxController {
  final _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  void setCurrentPage(int index) => _currentPage.value = index;
}
