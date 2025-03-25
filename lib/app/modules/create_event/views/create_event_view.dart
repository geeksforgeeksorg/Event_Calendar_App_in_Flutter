import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_event_controller.dart';

/// A stateless widget responsible for creating a new event.
/// Uses GetX for state management and dependency injection.
class CreateEventView extends StatelessWidget {
  /// Initialize the CreateEventController using Get.put() for dependency injection.
  final CreateEventController controller = Get.put(CreateEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Text field to enter the event title.
            /// Updates the eventTitle variable in the controller on text change.
            TextField(
              decoration: InputDecoration(labelText: 'Event Title'),
              // Updates the controller state
              onChanged: (value) => controller.eventTitle.value = value,
            ),
            SizedBox(height: 20),

            /// Button to save the event. Calls the saveEvent method in the controller.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed:
                  controller.saveEvent, 
              child: Text('Save Event'),
            ),
          ],
        ),
      ),
    );
  }
}
