import 'package:flutter/material.dart';

class Navigate {
  void navigateToNextPage({context, pageRoute, isReplace = false}) {
    if (isReplace) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => pageRoute,
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => pageRoute,
        ),
      );
    }
  }

  void navigateToPreviousPage({context, data = null}) {
    Navigator.of(context).pop(data);
  }
}
