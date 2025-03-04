import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/news_controller.dart';
import 'model/news_history_model.dart';


class HistoryPage extends StatelessWidget {
  final NewsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Watched News History")),
      body: Obx(() {
        if (controller.newsHistory.isEmpty) {
          return Center(child: Text("No history available."));
        }

        return ListView.builder(
          itemCount: controller.newsHistory.length,
          itemBuilder: (context, index) {
            NewsHistory news = controller.newsHistory[index];
           return Card(
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Image.network(
                     news.image.isNotEmpty
                         ? news.image
                         : 'https://picsum.photos/100/100',
                     width: double.infinity,
                     height: 200,
                     fit: BoxFit.cover,
                   ),
                   SizedBox(height: 8),
                   Text(
                     news.title,
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(height: 4),
                   Text(news.description),
                 ],
               ),
             ),
           );

            //  ListTile(
            //   leading: Image.network(
            //     news.image.isNotEmpty ? news.image : 'https://via.placeholder.com/150',
            //     width: 100,
            //     height: 100,
            //     fit: BoxFit.cover,
            //   ),
            //   title: Text(news.title),
            //   subtitle: Text(news.description),
            // );
            // return Card(
            //   child: InkWell(
            //     onTap: () {
            //       controller.addToHistory(news); // Add news to history
            //       Get.to(() => NewsDetailPage(news: news));
            //     },
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Image.network(
            //             news.image.isNotEmpty
            //                 ? news.image
            //                 : 'https://picsum.photos/100/100',
            //             width: double.infinity,
            //             height: 200,
            //             fit: BoxFit.cover,
            //           ),
            //           SizedBox(height: 8),
            //           Text(
            //             news.title,
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           SizedBox(height: 4),
            //           Text(news.description),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clearHistory(); // Clear all history
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
