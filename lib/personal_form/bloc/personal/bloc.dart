


import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:personal_form/personal_form/model/personal_model.dart';

import 'event.dart';

class PersonalBloc extends Bloc<AddPersonalList, List<PersonalModel>> {
  PersonalBloc() : super([]){
    on<AddPersonalList>((event, emit) => emit(state..add(event.personalModel)));
  }

}