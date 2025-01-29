extension LongLenght on String {
  String formatLongLenght(int l) {
    if (length > l) {
      String cut = substring(0, l);
      String updateValue = "$cut...";
      return updateValue;
    } else {
      return this;
    }
  }
}
