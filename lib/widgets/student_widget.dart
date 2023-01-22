import 'package:flutter/material.dart';

class StudentWidget extends StatefulWidget {
  final List data;
  const StudentWidget({super.key, required this.data});

  @override
  State<StudentWidget> createState() => _StudentWidgetState();
}

class _StudentWidgetState extends State<StudentWidget> {
  void _detail(List result, String name) {
    int i = 0;
    result.isNotEmpty
        ? showDialog(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('OK'))
              ],
              content: SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: result.map(
                        (e) {
                          i++;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "$i. ${e['is_solved'] ? '✅' : '❌'} (${e['attempt']})  "),
                                Text(e['name']),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ),
          )
        : showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(name),
              content: const Text('Not Forked'),
            ),
          );
  }

  @override
  void initState() {
    widget.data.sort(
      (a, b) {
        if (a.total == 0 && b.total == 0) {
          return b.attempt.compareTo(a.attempt);
        }
        if (a.total == b.total) {
          // print('object');
          return a.attempt.compareTo(b.attempt);
        }
        return b.total.compareTo(a.total);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int l = widget.data[0].result.length;
    int i = 0;
    // for (int i = 0; i < data.length; i++) {
    //   if (data[i].result.runtimeType == List && data[i].result.isNotEmpty) {
    //     l = data[i].result.length;
    //     break;
    //   }
    // }
    print(l);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            border: TableBorder.all(color: Colors.black),
            // dataRowHeight: 40,
            // headingRowHeight: 40,
            columnSpacing: 20,
            checkboxHorizontalMargin: 10,
            horizontalMargin: 10,
            columns: const [
              DataColumn(
                  numeric: true,
                  label: Text('',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              DataColumn(
                  label: Text('Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              DataColumn(
                  label: Text('Total',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              // ...List.generate(
              //         l, (index) => DataColumn(label: Text('${index + 1}')))
              //     .toList(),
              DataColumn(
                  label: Text('Attempts',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20)))
            ],
            rows: widget.data.map((e) {
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
                      onTap: () => _detail(e.result, e.fullname)),
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
                  // ...List.generate(
                  //   l,
                  //   (index) => DataCell(
                  //     Text(
                  //       e.result.runtimeType == List &&
                  //               e.result.isNotEmpty &&
                  //               e.result[index]['is_solved'] == true
                  //           ? '✅'
                  //           : '❌',
                  //     ),
                  //   ),
                  // ),
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