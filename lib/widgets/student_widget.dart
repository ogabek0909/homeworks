import 'package:flutter/material.dart';

class StudentWidget extends StatelessWidget {
  final List data;
  const StudentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    int l = 0;
    int i = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i].result.runtimeType == List && data[i].result.isNotEmpty) {
        l = data[i].result.length;
        break;
      }
    }
    // data.sort(
    //   (a, b) => a.total.compareTo(b.total),
    // );
    print(l);
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            border: TableBorder.all(color: Colors.black),
            // dataRowHeight: 40,
            // headingRowHeight: 40,
            columnSpacing: 20,
            checkboxHorizontalMargin: 10,
            horizontalMargin: 10,
            columns: [
              const DataColumn(
                  numeric: true,
                  label: Text('',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              const DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              const DataColumn(
                  label: Text('Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              ...List.generate(
                      l, (index) => DataColumn(label: Text('${index + 1}')))
                  .toList(),
              const DataColumn(
                  label: Text('Attempts',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)))
            ],
            rows: data.map((e) {
              i++;
              return DataRow(
                cells: [
                  DataCell(Center(child: Text("$i"))),
                  DataCell(
                    Text(
                      e.fullname,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        e.result.isNotEmpty ? '${e.total}' : 'no',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                    l,
                    (index) => DataCell(
                      Text(
                        e.result.runtimeType == List &&
                                e.result.isNotEmpty &&
                                e.result[index] == 1
                            ? '✅'
                            : '❌',
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        e.attempt.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList()),
      ),
    );
  }
}


/*
DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Total')),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text(data.fullname)),
            DataCell(Text('$a')),
          ],
        ),
      ],
    );
*/