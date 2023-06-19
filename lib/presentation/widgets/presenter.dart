import 'package:flutter/material.dart';

class Presenter{

  Future<void> showMyInputDialog(
      {
        required BuildContext context,
        required String title,
        InputDecoration? decoration = const InputDecoration(),
        void Function(String)? onFieldSubmitted,
        required void Function(String)? onAcceptButtonPressed,
        required String acceptButtonTitle,
        required void Function()? onCancelButtonPressed,
        required String cancelButtonTitle,
      }) async {
    TextEditingController codeController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            TextFormField(
              controller: codeController,
              decoration: decoration,
              onFieldSubmitted: onFieldSubmitted,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: (){
                    onAcceptButtonPressed!(codeController.text);
                  },
                  child: Text(acceptButtonTitle),
                ),
                TextButton(
                  onPressed: onCancelButtonPressed,
                  child: Text(cancelButtonTitle),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> showAlertDialog({required BuildContext context,
    required String title,}) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showError(String error) {
    return SnackBar(
      content: Text(
        error,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.red,
    );
  }

  showSuccess(String message) {
    return SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.green,
    );
  }

  showPopUpYesNo(
      {required BuildContext context,
        required String title,
        required void Function() onYesPressed,
        required void Function() onNoPressed}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  onPressed: onYesPressed,
                  child: const Text("Sim"),
                ),
                TextButton(
                  onPressed: onNoPressed,
                  child: const Text("Não"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}