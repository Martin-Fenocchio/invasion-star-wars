extension FormatterString on String {
  String capitalize() {
    if (isEmpty) {
      return '';
    }

    if (length < 2) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
