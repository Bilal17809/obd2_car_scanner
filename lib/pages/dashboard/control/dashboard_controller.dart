
import 'package:get/get.dart';

class DashboardController extends GetxController{

  var setIndex=0.obs;

  void trackIndex(int index){
    setIndex.value=index;
  }
}