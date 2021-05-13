import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double miktar;
  final DateTime tarih;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.miktar, 
    @required this.tarih
  });
}
