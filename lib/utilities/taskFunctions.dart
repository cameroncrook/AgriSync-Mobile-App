import 'package:flutter/material.dart';
// functions for the various task widgets and views

Color getStatusColor(status) {
  Color statusColor = Colors.white;
    if (status == 1) {
      statusColor = Colors.blueGrey;
    } else if (status == 2) {
      statusColor = Colors.greenAccent;
    } else if (status == 4) {
      statusColor = Colors.redAccent;
    } 

  return statusColor;
}

String translateStatus(status) {
  String statusString = "";

  if (status == 1) {
    statusString = "Complete";
  } else if (status == 2) {
    statusString = "Working on it";
  } else if (status == 3) {
    statusString = "Haven't stated";
  } else if (status == 4) {
    statusString = "Stuck";
  }

  return statusString;
}