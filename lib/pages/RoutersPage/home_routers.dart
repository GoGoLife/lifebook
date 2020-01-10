import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../Home/AddRecord.dart';

Handler home_add_record_handle = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> param) {
    return AddRecordsVC();
  }
);
