




import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PersonalFormBloc extends FormBloc<String, String> {

  final name = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ]
  );
  final sname = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ]
  );
  final age = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      ageValidator
    ]
  );
  final tel = TextFieldBloc(
      validators: [
        FieldBlocValidators.required,
        phoneValidator
      ]
  );
  final idCard = TextFieldBloc(
      validators: [
        FieldBlocValidators.required,
        idCardLengthValidate
      ]
  );
  final address = TextFieldBloc();


  PersonalFormBloc() {
    addFieldBlocs(fieldBlocs: [
      name,
      sname,
      age,
      tel,
      idCard,
      address
    ]);
  }

  void addErrors() {

  }


  static String ageValidator(String string) {
    final ageRegex = RegExp(r'^[0-9]*$');
    if (string == null || string.isEmpty || ageRegex.hasMatch(string)) {
      return null;
    }
    return 'Age Must Be Number';
  }

  static String phoneValidator(String string) {
    final ageRegex = RegExp(r'^[0-9]{10}$');
    if (string == null || string.isEmpty || ageRegex.hasMatch(string)) {
      return null;
    }
    return 'Invalid Phone Number';
  }

  static String idCardLengthValidate (String string) {
    return string.length == 13 ? 'Invalid Id Card' : null;
  }



  @override
  void onSubmitting() async {
    // TODO: implement onSubmitting
    // emitFailure(failureResponse: 'xxx');
    emitSuccess(successResponse: 'success', canSubmitAgain: true);
  }

}