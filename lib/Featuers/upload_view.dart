import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_project/Core/NetWork/local_storage.dart';
import 'package:taskati_project/Core/Util/App_Buttons.dart';
import 'package:taskati_project/Core/Util/App_Colors.dart';
import 'package:taskati_project/Core/Util/App_Functions.dart';
import 'package:taskati_project/Core/Util/App_Text_Styles.dart';
import 'package:taskati_project/Featuers/home_view.dart';

String? path;
String name = '';

class UpLoadView extends StatefulWidget {
  const UpLoadView({super.key});

  @override
  State<UpLoadView> createState() => _UpLoadViewState();
}

class _UpLoadViewState extends State<UpLoadView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.greyColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                  onPressed: () {
                    //name and image are ok
                    if (path != null && name.isNotEmpty) {
                      AppLocal.cacheData(AppLocal.IMAGE_KEY, path);
                      AppLocal.cacheData(AppLocal.NAME_KEY, name);
                      AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);

                      AppFunctions.getMoveToNextPage(
                          context: context,
                          theScreenYouWantToProceed: const HomeView());

                      // no image
                    } else if (path == null && name.isNotEmpty) {
                      AppFunctions.showMySnackBar(
                          context, 'You need to upload your Image !!');
                      // no name
                    } else if (path != null && name.isEmpty) {
                      AppFunctions.showMySnackBar(
                          context, 'You need to register your Name !!');

                      //no image and no name
                    } else {
                      AppFunctions.showMySnackBar(context,
                          'You need to upload your Image,\n and register your Name !! ');
                    }
                  },
                  child: Text('Done', style: getSmallStyle(fontSize: 20))),
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
                  radius: 70,
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
                    decoration: InputDecoration(
                        hintText: 'Enter Your Name ...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                          ),
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
                // Image(image: AppImages.getMyFavouriteImage(assetName: 'Assets/accountImage.svg') as ImageProvider ),
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
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
