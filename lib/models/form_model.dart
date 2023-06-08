import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class FormModal {
  FormModal({
    required this.bookTitle,
    required this.date,
  }) : id = uuid.v4();
  final String id;
  final String bookTitle;
  final DateTime date;
  String get formattedDate {
    return formatter.format(date);
  }
}
