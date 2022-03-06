




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:personal_form/personal_form/bloc/personal/bloc.dart';
import 'package:personal_form/personal_form/bloc/personal/event.dart';
import 'package:personal_form/personal_form/model/personal_model.dart';

class ListPersonalScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPersonalScreenState();
  }

}

class _ListPersonalScreenState extends State<ListPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => PersonalBloc(),
        child: BlocBuilder<PersonalBloc, List<PersonalModel>>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(title: Text('All Personal'),),
              body: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: state.length,
                          itemBuilder:(__, int index) {
                            PersonalModel _p = state[index];
                            return ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed('detail', arguments: _p.toMap());
                              },
                              title: Text('Name: ${_p.name} \nSurName: ${_p.sname}'),
                              trailing: Icon(Icons.arrow_forward_ios),
                            );
                          }
                        )
                    ),
                    Center(
                      child: ButtonTheme(
                        minWidth: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('form').then((p) {
                              setState(() {
                                context.read<PersonalBloc>().add(AddPersonalList(personalModel: p as PersonalModel));
                              });
                            });
                          },
                          child: Text('Add Personal'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
    );
  }

}