import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/models/mentor.dart';
import 'package:http/http.dart' as http;

part 'mentor_event.dart';
part 'mentor_state.dart';

class MentorBloc extends Bloc<MentorEvent, MentorState> {
  MentorBloc() : super(MentorInitial()) {
    List<Mentor> mentors = [];
    on<GetMentorEvent>((event, emit) async {
      if (mentors.isEmpty) {
        emit(MentorLoading());
        final response = await http.get(
          Uri.parse(
              'https://654b7a515b38a59f28ef2618.mockapi.io/kampenies/mentor'),
          headers: {
            "Content-Type": "application/json",
          },
        );
        mentors = mentorFromJson(response.body);
      }
      emit(MentorSuccess(mentors: mentors));
    });
  }
}
