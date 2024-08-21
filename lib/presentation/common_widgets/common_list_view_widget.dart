import 'package:flutter/material.dart';

import 'common_app_bar.dart';
import 'list_item_widget.dart';

class CommonListViewWidget extends StatelessWidget {
  const CommonListViewWidget({
    super.key,
    this.onTap,
    required this.heading,
    required this.itemList,
    this.dataExtractor,
  });

  final String heading;
  final Function(int index, dynamic item)? onTap;
  final List<dynamic> itemList;
  final Map<String, String> Function(dynamic)? dataExtractor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              heading,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            itemList.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        'No Data!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: itemList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          final item = itemList[index];
                          final extractedData = dataExtractor!(item);
                          return InkWell(
                            onTap: () => onTap!(index, item),
                            child: ListItemWidget(
                              mainText: extractedData['mainText'] ?? '',
                              subText: extractedData['subText'] ?? '',
                              rightText: extractedData['rightText'] ?? '',
                            ),
                          );
                        }),
                  ),
          ],
        ));
  }
}
