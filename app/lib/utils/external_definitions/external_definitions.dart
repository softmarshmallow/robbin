class ExternalDefinitionUtils {
  static String buildOxfordDefinition(String token) {
    return "https://www.lexico.com/definition/$token";
  }

  static String buildGoogleDefinition(String token) {
    var uri = 'https://www.google.com/search?q=$token';
    var encoded = Uri.encodeFull(uri);
    return encoded;
  }
}
