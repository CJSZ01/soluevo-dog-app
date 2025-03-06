final class Endpoints {
  Endpoints ._();
  static final String _dogBaseUrl = 'https://dog.ceo/api';
  static final String _catBaseUrl = 'https://api.thecatapi.com/v1';
  static  String get getDogImages => '$_dogBaseUrl/breeds/image/random';
  static  String get getCatImages => '$_catBaseUrl/images/search';
}