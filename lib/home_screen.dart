import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:rapidor_machine_test/table_data_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LinkedScrollControllerGroup controllerGroup = LinkedScrollControllerGroup();

  ScrollController? headerScrollController;
  ScrollController? dataScrollController;

  List<DataRow> shuffle(List<DataRow> array) {
    var random = Random(); //import 'dart:math';

    for (var i = array.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = array[i];
      array[i] = array[n];
      array[n] = temp;
    }
    return array;
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    headerScrollController = controllerGroup.addAndGet();
    dataScrollController = controllerGroup.addAndGet();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<double> rTime = [0.00, 5.00, 10.00, 15.00, 20.00, 30.00];
    rTime.shuffle();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(child: Text('Timings for a sports Person')),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weekly Report of Sports Person',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4CAF50)),
                    onPressed: () {
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.landscapeRight]);
                    },
                    child: const Text(
                      'View Report',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SafeArea(
              child: Stack(
                children: [
                  tableContent(),
                  tableHeader(),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget tableContent() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataTable(
            dataRowHeight: 80,
            columns: TableDataHelper.kTableColumnList.getRange(0, 1).map((e) {
              return const DataColumn(
                label: SizedBox(),
              );
            }).toList(),
            rows: TableDataHelper.kTableColumnList.getRange(0, 7).map((e) {
              return DataRow(cells: [
                DataCell(
                  SizedBox(
                    width: TableDataHelper.kTableColumnsList[0].width,
                    child: Text(e.title ?? '',
                        style: const TextStyle(color: Colors.blue)),
                  ),
                )
              ]);
            }).toList(),
            headingRowColor: MaterialStateProperty.all(Colors.green.shade100),
            dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
          ), // start
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: dataScrollController,
              child: DataTable(
                  dataRowHeight: 80,
                  headingRowColor: MaterialStateProperty.all(Colors.blue),
                  dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
                  columns: TableDataHelper.kTableColumnsList
                      .getRange(1, TableDataHelper.kTableColumnsList.length)
                      .map((e) {
                    return DataColumn(
                      label: SizedBox(
                        child: Text(
                          e.title ?? '',
                        ),
                        width: e.width ?? 0,
                      ),
                    );
                  }).toList(),
                  rows: shuffle(
                    List.generate(7, (index) {
                      return DataRow(cells: [
                        DataCell(
                          SizedBox(
                            child: Text(
                              '${index * 2 + index * 2 + index * 3 + index * 4 + index * 3 + index * 2 + index * 4 + index * 2}:00 MM',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green),
                            ),
                            width: TableDataHelper.kTableColumnsList[1].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 2}:  00 MM'),
                            width: TableDataHelper.kTableColumnsList[2].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 3}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[3].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${(index * 4 + index * 2)}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[4].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 3}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[5].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 2}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[6].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 4}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[7].width,
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            child: Text('${index * 2}:00 MM'),
                            width: TableDataHelper.kTableColumnsList[8].width,
                          ),
                        ),
                      ]);
                    }),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableHeader() {
    return Row(
      children: [
        DataTable(
          columns: TableDataHelper.kTableColumnsList.getRange(0, 1).map((e) {
            return DataColumn(
              label: SizedBox(
                child: Text(
                  e.title ?? '',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                width: e.width ?? 0,
              ),
            );
          }).toList(),
          rows: const [],
          headingRowColor: MaterialStateProperty.all(Colors.green),
          dataRowColor: MaterialStateProperty.all(Colors.green.shade100),
        ), // start
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: headerScrollController,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(Colors.blue),
              dataRowColor: MaterialStateProperty.all(Colors.blue.shade100),
              columns: TableDataHelper.kTableColumnsList
                  .getRange(1, TableDataHelper.kTableColumnsList.length)
                  .map((e) {
                return DataColumn(
                  label: SizedBox(
                    child: Text(
                      e.title ?? '',
                      style: TextStyle(color: Colors.green.shade100),
                    ),
                    width: e.width ?? 0,
                  ),
                );
              }).toList(),
              rows: const [],
            ),
          ),
        ),
      ],
    );
  }
}
