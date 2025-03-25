import 'package:get/get.dart';
import '../../../data/models/event_model.dart';

/// Controller for managing calendar events in the home view.
/// Uses GetX state management for reactive updates.
class HomeController extends GetxController {
  /// The currently selected day in the calendar.
  var selectedDay = DateTime.now().obs;

  /// The currently focused day in the calendar.
  var focusedDay = DateTime.now().obs;

  /// A map storing events, where each key is a date (DateTime),
  /// and the value is a list of events occurring on that day.
  var events = <DateTime, List<EventModel>>{}.obs;

  /// Retrieves events for a specific day.
  /// If no events exist for the given day, returns an empty list.
  List<EventModel> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  /// Adds a new event to the specified date.
  /// If the date already exists in the map, it appends the event.
  /// Otherwise, it creates a new entry for the date.
  void addEvent(DateTime date, String title) {
    if (events.containsKey(date)) {
      events[date]!
          .add(EventModel(title: title)); // Append event to existing list
    } else {
      events[date] = [
        EventModel(title: title)
      ]; // Create a new list for this date
    }
    events.refresh(); // Manually refresh to trigger UI updates
  }
}
