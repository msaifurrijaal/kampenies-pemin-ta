import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kampenies/repository/mentor/mentor_repository.dart';

import '../../../data/models/mentor.dart';

part 'mentor_event.dart';
part 'mentor_state.dart';

class MentorBloc extends Bloc<MentorEvent, MentorState> {
  final MentorRepository _mentorRepository;
  MentorBloc(this._mentorRepository) : super(MentorInitial()) {
    List<Mentor> mentorsData = [];

    on<GetMentorEvent>((event, emit) async {
      if (mentorsData.isEmpty) {
        emit(MentorLoading());
        try {
          var mentors = await _mentorRepository.getMentors();
          mentorsData = mentors;
          emit(MentorSuccess(mentors: mentorsData));
        } catch (error) {
          emit(MentorError(errorMessage: error.toString()));
        }
      } else {
        emit(MentorSuccess(mentors: mentorsData));
      }
    });
  }
}
