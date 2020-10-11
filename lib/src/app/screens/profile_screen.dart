import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/models/my_user.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

import '../constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController dateController;
  TextEditingController addressController;
  TextEditingController identificationNumberController;

  User get firebaseUser => Get.find<AuthController>().user.value;

  MyUser get myUser => Get.find<AuthController>().myUser.value;

  AuthController get authController => Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: myUser?.name ?? firebaseUser.displayName);
    phoneController = TextEditingController(text: myUser?.phoneNumber ?? "");
    dateController = TextEditingController(text: myUser?.birthDate ?? "");
    addressController = TextEditingController(text: myUser?.address ?? "");
    identificationNumberController =
        TextEditingController(text: myUser?.address ?? "");
  }

  String Function(String) nonEmptyValidator(String fieldName) => (String val) {
        if (val?.isEmpty ?? false) {
          return "$fieldName can't be empty!";
        }
        return null;
      };

  bool isSubmitting = false;

  DateTime birthDate;

  Future handle() async {
    setState(() {
      isSubmitting = true;
    });
    if (formKey.currentState.validate()) {
      final user = MyUser()
        ..name = nameController.value.text
        ..identificationNumber = identificationNumberController.value.text
        ..phoneNumber = phoneController.value.text
        ..email = firebaseUser.email
        ..address = addressController.value.text
        ..birthDate = dateController.value.text;
      await authController.myUserDocument.set(user.toData());
    }
    setState(() {
      isSubmitting = false;
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).primaryTextTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 32.0),
                Text('Name',
                    style: Theme.of(context).accentTextTheme.bodyText1),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Full Name (e.g: Budi Raharja)"),
                  validator: nonEmptyValidator('Name'),
                ),
                SizedBox(height: 16.0),
                Text('Identity Number (KTP/SIM/Passport/Student ID)',
                    style: Theme.of(context).accentTextTheme.bodyText1),
                TextFormField(
                  controller: identificationNumberController,
                  decoration:
                      InputDecoration(hintText: "KTP/SIM/Passport/Student ID"),
                  validator: nonEmptyValidator('Identity Number'),
                ),
                SizedBox(height: 16.0),
                Text('Phone Number',
                    style: Theme.of(context).accentTextTheme.bodyText1),
                TextFormField(
                  controller: phoneController,
                  validator: (String val) {
                    final nonEmptyValidation = nonEmptyValidator('Phone Number')(val);
                    if (nonEmptyValidation?.isEmpty ?? true) {
                      if (GetUtils.isPhoneNumber(val)) {
                        return null;
                      }
                      return "Phone Number is not valid";
                    }
                    return nonEmptyValidation;
                  },
                  decoration: InputDecoration(
                      hintText: "Phone Number (e.g: +6281123010123)"),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.0),
                Text('Birth Date',
                    style: Theme.of(context).accentTextTheme.bodyText1),
                TextFormField(
                  controller: dateController,
                  validator: (String val) {
                    final nonEmptyResult = nonEmptyValidator('Birth Date')(val);
                    if (nonEmptyResult?.isEmpty ?? true) {
                      if (!birthDateRegEx.hasMatch(val)) {
                        return "Birth date must follow yyyy-mm-dd format (e.g: 1998-08-08)";
                      }
                      return null;
                    }
                    return nonEmptyResult;
                  },
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 16.0),
                Text('Address',
                    style: Theme.of(context).accentTextTheme.bodyText1),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                      hintText:
                          "Full Address (e.g: Jalan Margonda Raya No. 1, Kukusan, Beji, Depok, 68145"),
                  validator: nonEmptyValidator('Address'),
                  maxLines: 5,
                  keyboardType: TextInputType.streetAddress,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: isSubmitting ? null : handle,
                  child: isSubmitting
                      ? Center(
                          child: SizedBox(
                              width: 16.0,
                              height: 16.0,
                              child: CircularProgressIndicator()))
                      : Text('Save Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

RegExp birthDateRegEx =
    RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$');
