import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pharmacy/models/login_model.dart';
import 'package:pharmacy/repository/login_repository.dart';
import 'package:pharmacy/utils/keys.dart';

class LoginBloc {
  final _loginRepository = LoginRepository();
  /*final BehaviorSubject<List<ListOfDepartment>> _departmentController = BehaviorSubject<List<ListOfDepartment>>();
  Stream<List<ListOfDepartment>> get getDepartmentStream =>
      _departmentController.stream;*/

  Future<String?> fetchSigninRespose(
      BuildContext context,
      String email,
      String pw,
      ) async {
    if (loginFormKey.currentState!.validate()) {
      //print("all fields are valid");
      try {
        setWaitingState(true);
        var map = new Map<String, dynamic>();
        map['email'] = email;
        map['password'] = pw;
        map['fcm_token'] = '234';
        map['device'] = 'Android';
        String login_model_string =
        await _loginRepository.fetchSigninRespose(map);
        Login login_model = Login.fromJson(json.decode(login_model_string));
        if (login_model.status) {
          return login_model_string;
        } else {
        Fluttertoast.showToast(
            msg: login_model.msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        }
      } on SocketException catch (err) {
        Fluttertoast.showToast(
            msg: err.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } catch (err) {
        Fluttertoast.showToast(
            msg: err.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } finally {
        return null;
        setWaitingState(false);
      }
    }
  }

  final _waitingStateController = BehaviorSubject<bool>();
  Stream<bool> get getWaitingStateStream => _waitingStateController.stream;
  bool isWaiting = false;

  void setWaitingState(bool val) {
    isWaiting = val;
    _waitingStateController.sink.add(isWaiting);
  }

  void dispose() {
    _waitingStateController.close();
  }
}

final loginBloc = LoginBloc();
