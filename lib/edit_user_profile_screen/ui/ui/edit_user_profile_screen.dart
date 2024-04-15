import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magical_change/data/data_model/user_data_model.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_bloc.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_event.dart';
import 'package:magical_change/edit_user_profile_screen/bloc/edit_user_profile_screen_state.dart';

class EditUserProfileScreen extends StatefulWidget {
  final UserDataModel userListData;
  final int index;

  const EditUserProfileScreen({
    super.key,
    required this.userListData,
    required this.index,
  });

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  late var nameController = TextEditingController();
  late var emailController = TextEditingController();
  late var phoneNumberController = TextEditingController();
  late var addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.userListData.name);
    emailController = TextEditingController(text: widget.userListData.email);
    phoneNumberController = TextEditingController(
        text: widget.userListData.phoneNumber.toString());
    addressController =
        TextEditingController(text: widget.userListData.address);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User Profile Screen')),
      body: BlocConsumer<EditUserProfileScreenBloc, EditUserProfileScreenState>(
        buildWhen: (previous, current) => current is! SuccessDataSavedState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case EditUserProfileScreenLoadingState :
              return Center(child: CircularProgressIndicator());

            case EditUserProfileScreenLoadedState:
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          // You can add more complex email validation logic here if needed
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          // Check if the entered value is a valid integer
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                final  UserDataModel userData = UserDataModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    address: addressController.text,
                                    avatar: "",
                                    phoneNumber:
                                        int.parse(phoneNumberController.text),
                                  );
                                  BlocProvider.of<EditUserProfileScreenBloc>(
                                          context)
                                      .add(SavedButtonClickedEvent(
                                    userDataEvent: userData,
                                    index: widget.index,
                                  ));
                                }
                              },
                              child: Text('Save'),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );

            default:
              return Center(child: Text('Data not available'));
          }
        },
        listenWhen: (previous, current) =>
            current is SuccessDataSavedState,
        listener: (context, state) async {
          if (state is SuccessDataSavedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Data saved successfully')));
            await Future.delayed(Duration(seconds: 2));
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
