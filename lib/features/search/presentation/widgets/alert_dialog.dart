import 'package:breaking_app/features/search/logic/search_characters.dart';
import 'package:breaking_app/features/search/presentation/widgets/drop_down_field.dart';
import 'package:breaking_app/features/search/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({super.key, required this.cxt});

  final BuildContext cxt;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Material Alert Dialog'),
      content: Column(
        children: [
          Row(
            children: [
              SearchField(
                searchController: cxt.read<SearchCharacterCubit>().speciesController,
                labelText: 'Species',
              ),
              SearchField(
                searchController: cxt.read<SearchCharacterCubit>().typeController,
                labelText: 'Type',
              ),
            ],
          ),
          Row(
            children: [
              DropdownField(
                items: cxt.read<SearchCharacterCubit>().genderList,
                value: cxt.read<SearchCharacterCubit>().gender,
              ),
              DropdownField(
                items: cxt.read<SearchCharacterCubit>().statusList,
                value: cxt.read<SearchCharacterCubit>().status,
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              //action code for "Yes" button
            },
            child: const Text('Yes')),
        TextButton(
          onPressed: () {
            Navigator.pop(context); //close Dialog
          },
          child: const Text('Close'),
        )
      ],
    );
  }
}
