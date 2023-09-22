import 'package:intl/intl.dart';

class HelperMethods {
  List<String> parseList(String listString) {
    // Remove square brackets at the beginning and end of the string
    listString = listString.substring(1, listString.length - 1);

    // Split the string by commas and trim each element
    List<String> elements = listString.split(',').map((e) => e.trim()).toList();

    // Parse each element and add it to the result list
    List<String> result = [];
    for (String element in elements) {
      result.add(element);
    }

    return result;
  }

  String formatNotificationDateTime(int microsecondsSinceEpoch,
      {bool isUtc = false}) {
    DateTime notificationDate =
        DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
    // formateDateTimeString(notificationDateString,
    //     formatString: 'yyyy-MM-ddThh:mmZ');
    // notificationDate.microsecondsSinceEpoch
    if (isUtc) {
      notificationDate = DateTime.utc(
          notificationDate.year,
          notificationDate.month,
          notificationDate.day,
          notificationDate.hour,
          notificationDate.minute,
          notificationDate.second);
    }
    DateTime currentDateTime = DateTime.now();
    if (currentDateTime.difference(notificationDate).inDays <= 0
        // isSameDay(notificationDate, currentDateTime)
        ) {
      if (currentDateTime.difference(notificationDate).inMinutes < 2) {
        return 'now';
      } else if (currentDateTime.difference(notificationDate).inMinutes > 60) {
        // logger.d(currentDateTime.difference(notificationDate).inMinutes);
        // logger.d(currentDateTime.timeZoneOffset.inHours);
        return '${currentDateTime.difference(notificationDate).inHours}h ago';
      } else {
        return '${currentDateTime.difference(notificationDate).inMinutes}m ago';
      }
    } /* else if (notificationDate.difference(currentDateTime).inDays == 1) {
      return 'Yesterday ' + formateDateToString(notificationDate, 'hh:mm a');
    } */
    else if (currentDateTime.difference(notificationDate).inDays < 365) {
      return '${currentDateTime.difference(notificationDate).inDays}d ago';
    } else {
      return "${(currentDateTime.difference(notificationDate).inDays / 365).round()}y ago";
    }
  }

  DateTime formateDateTimeString(
    String string, {
    String? formatString,
  }) {
    /* if (string.isEmpty) {
      return null;
    } */
    return DateFormat(formatString ?? 'yyyy-MM-dd').parse(string);
  }
}
