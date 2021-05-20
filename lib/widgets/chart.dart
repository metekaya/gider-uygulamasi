import 'package:flutter/material.dart';
import 'package:gider_uyg/models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].tarih.day == weekDay.day &&
            recentTransactions[i].tarih.month == weekDay.month &&
            recentTransactions[i].tarih.year == weekDay.year) {
          totalSum += recentTransactions[i].miktar;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'miktar': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['miktar'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['miktar'],
                totalSpending == 0.0
                    ? 0.0
                    : (data['miktar'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
