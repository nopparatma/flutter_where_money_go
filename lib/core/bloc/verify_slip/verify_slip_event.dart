import 'package:image_picker/image_picker.dart';

abstract class VerifySlipEvent {}

class ExecuteVerifySlipEvent extends VerifySlipEvent {
  List<XFile> listImages;

  ExecuteVerifySlipEvent({required this.listImages});

  @override
  String toString() {
    return 'ExecuteVerifySlipEvent{listImages: $listImages}';
  }
}
