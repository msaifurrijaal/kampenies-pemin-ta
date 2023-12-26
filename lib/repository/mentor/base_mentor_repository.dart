import 'package:kampenies/data/models/mentor.dart';

abstract class BaseMentorRepository {
  Future<List<Mentor>> getMentors();
}
