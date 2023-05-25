import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:zuba_karis/features/add_menu/domain/repositories/add_menu_repository.dart';
import 'package:zuba_karis/features/add_menu/presentation/manager/add_menu_bloc.dart';

import '../../../../core/common_widget/custom_text_field_widget.dart';
import '../../../../core/constants/color_value.dart';

class AddMenupage extends StatefulWidget {
  const AddMenupage({Key? key}) : super(key: key);

  @override
  State<AddMenupage> createState() => _AddMenupageState();
}

class _AddMenupageState extends State<AddMenupage> {
  final key = GlobalKey<FormState>();
  ValueNotifier<File> img = ValueNotifier(File(''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Menu"),
      ),
      body: BlocProvider<AddMenuBloc>(
        create: (context) => AddMenuBloc(
            repository: RepositoryProvider.of<AddMenuRepository>(context)),
        child: Center(
          child: Container(
            width: 80.h,
            height: 50.w,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.48),
                  offset: const Offset(-10, 10),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Form(
              key: key,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf'],
                        );

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          img.value = file;
                        }
                      },
                      child: ValueListenableBuilder(
                          valueListenable: img,
                          builder: (context, file, _) {
                            return file.path != ''
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 25.0),
                                    child: Image.file(
                                      file,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Image.asset("assets/images/add_image.png",
                                    width: 50.sp, height: 50.sp);
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Expanded(
                            child: CustomTextFieldWidget(
                              controller: TextEditingController(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              label: 'nama',
                              obsecure: false,
                            ),
                          ),
                          Expanded(
                            child: CustomTextFieldWidget(
                              inputType: TextInputType.number,
                              controller: TextEditingController(),
                              icon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text("Rp"),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              label: 'harga',
                              obsecure: false,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {}
                            },
                            child: const Text("Tambah ke menu"),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
