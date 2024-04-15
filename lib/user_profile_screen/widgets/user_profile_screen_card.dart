import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/data_model/user_data_model.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_bloc.dart';
import 'package:magical_change/user_profile_screen/bloc/user_profile_screen_event.dart';

class UserProfileScreenCard extends StatelessWidget {
  final UserDataModel userDataModel;
  final int index;
  const UserProfileScreenCard({super.key, required this.userDataModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(userDataModel.avatar),
              maxRadius: 25,
            ),
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          userDataModel.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 80),
                      SizedBox(
                        width: 80,
                        child: Text(
                          userDataModel.phoneNumber.toString(),
                           style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                    child: Text(
                      userDataModel.email,
                       style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                  
                    width: 300,
                    child: Text(userDataModel.address),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          BlocProvider.of<UserProfileScreenBloc>(context).add(UserProfileScreenEditButtonClickedEvent(index: index));
                        },
                        icon: Icon(Icons.edit),
                      ),
                      SizedBox(width: 200),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<UserProfileScreenBloc>(context).add(UserProfileScreenDeleteButtonClickedEvent(index: index));
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}