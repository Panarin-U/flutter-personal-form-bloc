



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_form/personal_form/model/personal_model.dart';

class PersonalDetailScreen extends StatefulWidget {

  final Map<String, dynamic> params;

  PersonalDetailScreen({ this.params });

  @override
  State<StatefulWidget> createState() {
    return _PersonalDetailScreenState(personalModel: PersonalModel.fromMap(params));
  }

}


class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
  
  final PersonalModel personalModel;

  _PersonalDetailScreenState({ this.personalModel });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${personalModel.name}'),
            SizedBox(height: 8,),
            Text('SurName: ${personalModel.sname}'),
            SizedBox(height: 8,),
            Text('Age: ${personalModel.age}'),
            SizedBox(height: 8,),
            Text('ID Card: ${personalModel.idCard}'),
            SizedBox(height: 8,),
            Text('Tel: ${personalModel.tel}'),
            SizedBox(height: 8,),
            Text('Address: ${personalModel.address}'),
            SizedBox(height: 8,),
          ],

        ),
      ),
    );
  }

}