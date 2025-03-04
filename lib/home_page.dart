
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'controller/news_controller.dart';
import 'drawer_menu.dart';
import 'model/database_model.dart';
import 'news_page_details.dart';

class HomePage extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text("News App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search logic here
            },
          ),
        ],
      ),
      drawer: DrawerMenu(),
      body: Column(
        children: [
          // Categories Button List
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryButton('general'),
                  categoryButton('business'),
                  categoryButton('technology'),
                  categoryButton('sports'),
                  categoryButton('entertainment'),
                  categoryButton('health'),
                  categoryButton('science'),
                ],
              ),
            ),
          ),

          // News List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: controller.newsList.length,
                  itemBuilder: (context, index) {
                    var news = controller.newsList[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          controller.addToHistory(news); // Add news to history
                          Get.to(() => NewsDetailPage(news: news));
                        },
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
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget categoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        controller.fetchNews(category);
      },
      child: Text(category),
    );
  }
}
