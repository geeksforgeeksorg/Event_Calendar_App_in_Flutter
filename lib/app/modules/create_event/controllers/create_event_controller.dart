import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

/// Controller for creating events using GetX.
class CreateEventController extends GetxController {
  // Observable event title
  var eventTitle = ''.obs; 

  /// Saves the event if the title is not empty.
  void saveEvent() {
    if (eventTitle.value.isNotEmpty) {
      // Get instance of HomeController
      HomeController homeController = Get.find(); 
      // Add event
      homeController.addEvent(homeController.selectedDay.value, eventTitle.value);
      // Close screen 
      Get.back(); 
    }
  }
}
