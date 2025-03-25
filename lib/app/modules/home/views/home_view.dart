import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/home_controller.dart';
import '../../create_event/views/create_event_view.dart';

/// A stateless widget that displays an event calendar and a list of events for the selected day.
/// Uses GetX for state management and navigation.
class HomeView extends StatelessWidget {
  /// Initialize the HomeController using Get.put() for dependency injection.
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          /// Calendar widget wrapped with Obx to update dynamically when the selected date changes.
          Obx(() => TableCalendar(
                // Currently focused day.
                focusedDay: controller.focusedDay.value,
                // Earliest selectable date.
                firstDay: DateTime.utc(2020, 1, 1),
                // Latest selectable date.
                lastDay: DateTime.utc(2030, 12, 31),

                /// Determines whether a day is selected.
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDay.value, day),

                /// Updates the selected and focused days when a date is tapped.
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;
                  controller.focusedDay.value = focusedDay;
                },

                /// Loads events for the selected day.
                eventLoader: controller.getEventsForDay,
              )),

          /// Expanded widget to ensure the event list takes up remaining screen space.
          Expanded(
            child: Obx(() {
              /// Retrieves the list of events for the selected day.
              final events =
                  controller.getEventsForDay(controller.selectedDay.value);

              /// Displays the events in a ListView.
              return ListView.builder(
                // Number of events for the selected day.
                itemCount: events.length,
                itemBuilder: (context, index) => ListTile(
                  // Displays event title.
                  title: Text(events[index].title),
                ),
              );
            }),
          ),
        ],
      ),

      /// Floating action button to navigate to the event creation page.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),

        /// Navigates to CreateEventView when pressed.
        onPressed: () => Get.to(() => CreateEventView()),
      ),
    );
  }
}
