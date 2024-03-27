import 'package:image_picker/image_picker.dart';

class VerifySlipState {
  VerifySlipState init() {
    return VerifySlipState();
  }

  VerifySlipState clone() {
    return VerifySlipState();
  }
}

class LoadingVerifySlipState extends VerifySlipState {
  @override
  String toString() {
    return 'LoadingVerifySlipState{}';
  }
}

class ErrorVerifySlipState extends VerifySlipState {
  List<XFile>? errorImages;

  ErrorVerifySlipState({this.errorImages});

  @override
  String toString() {
    return 'ErrorVerifySlipState{}';
  }
}

class SuccessVerifySlipState extends VerifySlipState {
  @override
  String toString() {
    return 'SuccessVerifySlipState{}';
  }
}
