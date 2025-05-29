extension Datetime2Now on DateTime? {
  String diff() {
    if (this == null) return "";
    final now = DateTime.now();
    final difference = now.difference(this!);

    if (difference.inDays > 0) {
      return "${difference.inDays} days ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hours ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minutes ago";
    } else {
      return "just now";
    }
  }
}
