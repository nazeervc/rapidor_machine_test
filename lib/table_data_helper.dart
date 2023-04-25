
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rapidor_machine_test/table_column.dart';

class TableDataHelper {
  static List<TableColumns> kTableColumnsList = [
    TableColumns(title: 'Total info for the week', width: 150.0,color: Color(0xffffffff)),
    TableColumns(title: 'Total (Sun-Sat)', width: 100.0),
    TableColumns(title: 'Sun', width: 70.0),
    TableColumns(title: 'Mon', width: 70.0),
    TableColumns(title: 'Tue', width: 70.0),
    TableColumns(title: 'Wed', width: 70.0),
    TableColumns(title: 'Thu', width: 70.0),
    TableColumns(title: 'Fri', width: 70.0),
    TableColumns(title: 'Sat', width: 70.0),

  ];

  static List<TableColumns> kTableColumnList = [
    TableColumns(title: 'Running Time', width: 150.0,height: 100),
    TableColumns(title: 'Jogging Time', width: 100.0),
    TableColumns(title: 'Exercise Time', width: 70.0),
    TableColumns(title: 'Total Time \n(Running+Jogging+Ex ercise)', width: 70.0),
    TableColumns(title: 'Running \nTime engagement % \n(Running / Total Time)', width: 70.0),
    TableColumns(title: 'Jogging \nTime engagement % \n(Jogging / Total Time)', width: 70.0),
    TableColumns(title: 'Exercise \nTime engagement % \n(Exercise / Total Time)', width: 70.0),
  ];
}
