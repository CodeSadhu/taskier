import 'package:appwrite/appwrite.dart';

class AppwriteService {
  static late Account account;
  static late Databases database;
  // static late Collection collection;
  static late Permission permission;

  static void initialize({
    required String endpoint,
    required String projectId,
  }) {
    final client = Client();
    client
        .setEndpoint(endpoint)
        .setProject(projectId)
        .setSelfSigned(status: true);

    account = Account(client);
    database = Databases(client);
  }
}
