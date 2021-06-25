import 'package:flutter/material.dart';

var snackBar = (String message) => SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
