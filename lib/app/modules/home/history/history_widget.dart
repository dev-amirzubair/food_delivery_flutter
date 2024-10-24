import 'package:flutter/material.dart';
import 'package:food_delivery/app/Widgets/cusotm_body_widget.dart';
import 'package:food_delivery/app/constants/colors.dart';
import 'package:food_delivery/app/modules/home/history/viewmodel.dart';
import 'package:provider/provider.dart';

class HistoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyViewModal = Provider.of<HistoryViewModal>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          // Wrap ListView.separated inside Expanded to handle scrolling properly
          CusotmBodyWidget(
            childern: ListView.builder(
              itemCount: historyViewModal.historyData.length,
              itemBuilder: (context, index) {
                final String date = historyViewModal.historyData[index]['date'];
                final String invoice =
                    historyViewModal.historyData[index]['invoice'];
                final products =
                    historyViewModal.historyData[index]['products'];
                final vat = historyViewModal.historyData[index]['vat'];
                final serviceCharges =
                    historyViewModal.historyData[index]['serviceCharges'];
                final delivery =
                    historyViewModal.historyData[index]['delivery'];
                final total = historyViewModal.historyData[index]['total'];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date: $date',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'Receipt#: ',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                              Text(invoice.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, right: 15),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(
                              3), // Adjust these values for better fit
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                        },
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            children: [
                              Text(
                                'Ordered items',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Pcs',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          ...products.map((product) {
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(product['productName']),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(product['pices'].toString()),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(product['price'].toString()),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Vat'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(''),
                              ),
                              Center(
                                child: Text('Rs $vat'),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Service charges'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(''),
                              ),
                              Center(
                                child: Text('Rs $serviceCharges'),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Delivery charges:'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(''),
                              ),
                              Center(
                                child: Text('Rs $delivery'),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Color.fromARGB(
                                            125, 227, 144, 85)))),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Total'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(''),
                              ),
                              Center(
                                child: Text('Rs: $total'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.primaryColor,
                      thickness: 1,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
