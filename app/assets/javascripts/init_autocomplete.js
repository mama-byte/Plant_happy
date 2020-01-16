const algoliaContainer = document.querySelector('#plant_address');

if (algoliaContainer) {
  var placesAutocomplete = places({
    appId: "plZCVNX96EA2",
    apiKey: "49158a2ebe0ed769260ceade534dd2b2",
    container: algoliaContainer
  });
}
