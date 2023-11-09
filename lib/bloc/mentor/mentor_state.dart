part of 'mentor_bloc.dart';

abstract class MentorState {}

class MentorInitial extends MentorState {}

class MentorLoading extends MentorState {}

class MentorSuccess extends MentorState {
  final List<Mentor> mentors;
  MentorSuccess({
    required this.mentors,
  });
}
