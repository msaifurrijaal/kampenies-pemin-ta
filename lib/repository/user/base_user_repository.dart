import '../../data/models/user.dart';

abstract class BaseUserRepository {
  Future<List<User>> getUsers();
}