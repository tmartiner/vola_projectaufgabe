import 'package:vola_projectaufgabe/src/features/feed/domain/post.dart';
import 'package:vola_projectaufgabe/src/features/feed/domain/user.dart';
import 'database_repository.dart';

class MockDatabase implements DatabaseRepository {
  List<User> _users = [];
  Map<User, List<Post>> _userPosts = {};

  // Initialisierung der Benutzer

  void initializeUsers() {
    _users = [
      User(
          id: '1',
          username: 'user1',
          email: 'user1@example.com',
          fullName: "Alva Hunt",
          profilePictureUrl:
              "https://wallpapers.com/images/high/pretty-profile-pictures-nxkpy9du2vqmiyo4.webp"),
      User(
          id: '2',
          username: 'user2',
          email: 'user2@example.com',
          fullName: "Gerry Pierce",
          profilePictureUrl:
              "https://wallpapers.com/images/high/pretty-profile-pictures-0yqm3qtxuod2ro9x.webp"),
      User(
          id: '3',
          username: 'user3',
          email: 'user3@example.com',
          fullName: "Roxanne Litle",
          profilePictureUrl:
              "https://wallpapers.com/images/high/pretty-profile-pictures-v40654u110omdbis.webp"),
    ];

    // Füge einige Beispieldaten für die Posts hinzu
    _userPosts[_users[0]] = [
      Post(
          id: '1',
          userId: '1',
          content: 'Hello World!',
          timestamp: DateTime.now()),
      Post(
          id: '2',
          userId: '2',
          content: 'This is a test post.',
          timestamp: DateTime.now()),
    ];
    _userPosts[_users[1]] = [
      Post(
          id: '3',
          userId: '2',
          content: 'Feeling great today!',
          timestamp: DateTime.now()),
    ];
    _userPosts[_users[2]] = [];
  }

  @override
  List<User> getUsers() {
    return _users;
  }

  @override
  List<Post> getUserPosts(User user) {
    return _userPosts[user] ?? [];
  }

  @override
  void addPost(Post post) {
    if (_userPosts.containsKey(post.userId)) {
      _userPosts[post.userId]?.add(post);
    }
  }
}
