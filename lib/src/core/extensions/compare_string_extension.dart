extension CompareStringExtension on String {
  bool compareStringValue(String value) {
    var formatValue = _formatText(this);
    var formatSearch = _formatText(value);
    return formatValue.contains(formatSearch);
  }
}

String _formatText(String value) {
  return _removeAccentuation(value)
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}

String _removeAccentuation(String text) {
  return text
      .replaceAll(RegExp(r'[áàãâä]'), 'a')
      .replaceAll(RegExp(r'[éèêë]'), 'e')
      .replaceAll(RegExp(r'[íìîï]'), 'i')
      .replaceAll(RegExp(r'[óòõôö]'), 'o')
      .replaceAll(RegExp(r'[úùûü]'), 'u')
      .replaceAll(RegExp(r'[ç]'), 'c')
      .replaceAll(RegExp(r'[ñ]'), 'n');
}
