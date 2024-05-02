import 'package:vola_projectaufgabe/src/features/feed/domain/post.dart';
import 'package:vola_projectaufgabe/src/features/feed/domain/user.dart';

abstract class DatabaseRepository {
  /// Initialisierung der Benutzer
  void initializeUsers();

  /// Gibt eine Liste aller Benutzer in der Datenbank zurück.
  List<User> getUsers();

  /// Gibt eine Liste aller Posts für den angegebenen Benutzer zurück.
  List<Post> getUserPosts(User user);

  /// Fügt einen neuen Post zur Datenbank hinzu.
  void addPost(Post post);
}
