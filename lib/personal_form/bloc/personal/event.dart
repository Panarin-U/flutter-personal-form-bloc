



import 'package:equatable/equatable.dart';
import 'package:personal_form/personal_form/model/personal_model.dart';

class AddPersonalList extends Equatable {

  final PersonalModel personalModel;

  AddPersonalList({ this.personalModel });


  @override
  // TODO: implement props
  List<Object> get props => [personalModel];

}