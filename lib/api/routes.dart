const String baseUrl = "https://superheroapi.com/api";
const String accessToken = "109428608296429";

String powerstatsHeroPath(String characterId) {
  return "$baseUrl/$accessToken/$characterId/powerstats";
}

String imageHeroPath(String characterId) {
  return "$baseUrl/$accessToken/$characterId/image";
}

String workHeroPath(String characterId) {
  return "$baseUrl/$accessToken/$characterId/work";
}
