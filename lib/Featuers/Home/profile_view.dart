import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Functions.dart';
import 'package:taskati_project/Featuers/Home/home_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = '';
  String? path;
  late Box<bool> modeBox;

  @override
  void initState() {
    super.initState();
    path = AppLocal.getCacheData(AppLocal.NAME_KEY);
    path = AppLocal.getCacheData(AppLocal.IMAGE_KEY);
    modeBox = Hive.box('mode');
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = modeBox.get('darkmode') ?? false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              AppFunctions.getMoveToNextPage(
                  context: context,
                  theScreenYouWantToProceed: const HomeView());
            },
          ),
          backgroundColor: AppColors.greyColor,
          actions: [
            IconButton(
              icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode_outlined),
              onPressed: () {
                setState(() {
                  modeBox.put('darkmode', !isDark);
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //const Gap(45),
                CircleAvatar(
                  radius: 90,
                  backgroundImage: (path != null)
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('Assets/accountingImage.png'),
                ),
                const Gap(40),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: CustomButton(
                    text: 'UpLoad from Camera',
                    onPressed: () {
                      upLoadFromCamera();
                    },
                  ),
                ),
                const Gap(15),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: CustomButton(
                      text: 'UpLoad from Gallery',
                      onPressed: () {
                        upLoadFromGallery();
                      }),
                ),
                const Gap(10),
                Divider(
                  color: AppColors.greyColor,
                  endIndent: 25,
                  indent: 25,
                  thickness: 1.5,
                ),
                const Gap(10),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.digitsOnly
                    // ],
                    // to connet wht is written inside the TextFormfield with the variable i will use as a condition
                    keyboardType: TextInputType.name,
                    //style: getBodyStyle(),
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name ...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.redColor,
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  upLoadFromCamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  upLoadFromGallery() async {
    var pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, requestFullMetadata: true);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
