import 'package:intl/intl.dart';

class HelperMethods {
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
