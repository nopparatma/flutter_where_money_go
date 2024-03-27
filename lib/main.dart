import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_where_money_go/app/app_config.dart';
import 'package:flutter_where_money_go/core/bloc/verify_slip/verify_slip_bloc.dart';
import 'package:flutter_where_money_go/core/bloc/verify_slip/verify_slip_event.dart';
import 'package:flutter_where_money_go/core/bloc/verify_slip/verify_slip_state.dart';
import 'package:flutter_where_money_go/core/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<VerifySlipBloc>(
          create: (context) => VerifySlipBloc(),
        ),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayColor: Colors.black.withOpacity(0.5),
        overlayWidgetBuilder: (progress) => buildOverlayLoader(),
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Colors.green,
        size: 100,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<XFile> imageFileList = [];

  @override
  void initState() {
    super.initState();
  }

  void selectImages() async {
    final List<XFile> selectedImages = await ImagePicker().pickMultiImage();

    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    debugPrint("Image List Length: ${imageFileList.length}");
    setState(() {});
  }

  void uploadImages() {
    if (imageFileList.isEmpty) {
      showSnackBar(
        'Warning!',
        'Please select image.',
        ContentType.warning,
      );
      return;
    }

    BlocProvider.of<VerifySlipBloc>(context).add(
      ExecuteVerifySlipEvent(
        listImages: imageFileList,
      ),
    );
  }

  void clearImage() {
    setState(() {
      imageFileList = [];
    });
  }

  void showSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifySlipBloc, VerifySlipState>(
      listener: (context, state) {
        if (state is ErrorVerifySlipState) {
          setState(() {
            imageFileList = state.errorImages ?? [];
          });

          showSnackBar(
            '${state.errorImages?.length ?? 0} Image Failed Upload!',
            'I\'m not sure why, but I\'d like to be the one at the API. Let\'s try again.',
            ContentType.failure,
          );

          return context.loaderOverlay.hide();
        }

        if (state is LoadingVerifySlipState) {
          return context.loaderOverlay.show();
        }

        if (state is SuccessVerifySlipState) {
          clearImage();
          showSnackBar(
            'Success Upload!',
            'The data has been successfully saved.',
            ContentType.success,
          );
        }

        return context.loaderOverlay.hide();
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(AppConfig.applicationName),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('Select'),
                        onPressed: () => selectImages(),
                      ),
                      ElevatedButton(
                        child: const Text('Clear'),
                        onPressed: () => clearImage(),
                      ),
                      ElevatedButton(
                        child: const Text('Upload'),
                        onPressed: () => uploadImages(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: imageFileList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                File(imageFileList[index].path),
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
