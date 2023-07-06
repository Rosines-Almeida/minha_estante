String convertToUpperCase(String value) {
  List<String> words = value.split(" ");

  String result = words.map((word) => capitalizeFirstLetter(word)).join(" ");

  return result;
}

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}
