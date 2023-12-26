import 'package:bloc/bloc.dart';
import 'package:kampenies/repository/user/user_repository.dart';

import '../../../data/models/user.dart';
import '../../../repository/data_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      if (dataRepository.user.isEmpty) {
        emit(UserLoading());

        try {
          var users = await _userRepository.getUsers();
          dataRepository.setUser(users);
          emit(UserSuccess(users: dataRepository.user));
        } catch (error) {
          emit(UserError(errorMessage: error.toString()));
        }
      } else {
        emit(UserSuccess(users: dataRepository.user));
      }
    });

    on<SearchUserEvent>((event, emit) {
      List<User> filteredUser = dataRepository.user
          .where((user) =>
              user.name.toLowerCase().contains(event.query.toLowerCase()) ||
              user.division.name
                  .toLowerCase()
                  .contains(event.query.toLowerCase()))
          .toList();
      emit(UserSuccess(users: filteredUser));
    });
  }
}
