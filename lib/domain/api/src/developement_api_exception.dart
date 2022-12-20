import 'error.dart';

class DevelopementApiException implements ApiExceptionInterface {
  @override
  void onErrorConnection() {
    print("Erreur de connexion");
  }

  @override
  void onErrorServer() {
    print("Erreur du serveur");
  }

}