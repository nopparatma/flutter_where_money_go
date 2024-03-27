import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_where_money_go/core/get_it.dart';
import 'package:flutter_where_money_go/core/model/get_slip_data_rq.dart';
import 'package:flutter_where_money_go/core/model/get_slip_data_rs.dart';
import 'package:flutter_where_money_go/core/service/easy_slip_service.dart';
import 'package:image_picker/image_picker.dart';

import 'verify_slip_event.dart';
import 'verify_slip_state.dart';

class VerifySlipBloc extends Bloc<VerifySlipEvent, VerifySlipState> {
  final EasySlipService _easySlipService = getIt<EasySlipService>();

  VerifySlipBloc() : super(VerifySlipState().init()) {
    // ExecuteVerifySlipEvent
    on<ExecuteVerifySlipEvent>((event, emit) => mapExecuteVerifySlipToState(event, emit));
  }

  Future<VerifySlipState> init() async {
    return state.clone();
  }

  Future<void> mapExecuteVerifySlipToState(ExecuteVerifySlipEvent event, Emitter<VerifySlipState> emit) async {
    try {
      emit(LoadingVerifySlipState());

      List<XFile> successImages = [];
      List<XFile> errorImages = [];

      for (XFile file in event.listImages) {
        try {
          String imageBase64 = base64Encode(await file.readAsBytes());
          GetSlipDataRq rq = GetSlipDataRq(image: 'data:image/jpeg;base64,$imageBase64');
          GetSlipDataRs rs = await _easySlipService.getSlipData(rq);
          successImages.add(file);

          // TODO: Upload DB
          //
          //
        } catch (error) {
          errorImages.add(file);
        }
      }

      if (errorImages.isNotEmpty) {
        emit(ErrorVerifySlipState(errorImages: errorImages));
        return;
      }

      emit(SuccessVerifySlipState());
    } catch (e) {
      emit(ErrorVerifySlipState());
    }
  }
}
