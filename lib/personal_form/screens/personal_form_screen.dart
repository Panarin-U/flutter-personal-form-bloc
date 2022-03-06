



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:personal_form/personal_form/bloc/personal_form/bloc.dart';
import 'package:personal_form/personal_form/model/personal_model.dart';
import 'package:provider/provider.dart';

class PersonalForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalFormState();
  }

}

class _PersonalFormState extends State<PersonalForm> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PersonalFormBloc(),
        child: Builder(
          builder: (context) {
            final formBloc =  BlocProvider.of<PersonalFormBloc>(context);
            return Scaffold(
              appBar: AppBar(
                title: Text('Personal Form'),
              ),
              body: FormBlocListener<PersonalFormBloc, String, String>(
                onSuccess: (context, state) {
                  PersonalModel _p = PersonalModel(
                      name: formBloc.name.value,
                      sname: formBloc.sname.value,
                      age: formBloc.age.value,
                      tel: formBloc.tel.value,
                      idCard: formBloc.idCard.value,
                      address: formBloc.address.value
                  );
                  Navigator.of(context).pop(_p);

                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.name,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.sname,
                        decoration: const InputDecoration(
                          labelText: 'SurName',
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.age,
                        decoration: const InputDecoration(
                          labelText: 'Age',
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.tel,
                        decoration: const InputDecoration(
                          labelText: 'Tel',
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.idCard,
                        decoration: const InputDecoration(
                          labelText: 'Id Card',
                        ),
                      ),
                      SizedBox(height: 16,),
                      TextFieldBlocBuilder(
                        textFieldBloc: formBloc.address,
                        decoration: const InputDecoration(
                          labelText: 'Address',
                        ),
                      ),
                      SizedBox(height: 16,),
                      ElevatedButton(
                          onPressed: formBloc.submit, child: Text('Submit')
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        ),
    );
  }

}