import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_cup/data/models/news.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../helper/constants.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Articles data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/qatar.png",
            width: MediaQuery.of(context).size.width * 0.21,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/logo.png"),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(data.urlToImage),
                      fit: BoxFit.cover))),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat.yMMMEd().format(data.publishedAt),
                    style: Theme.of(context).textTheme.bodyLarge),
                Text("BY: ${data.author}",
                    style: Theme.of(context).textTheme.bodyLarge)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.description,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: primaryColor)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data.content,
                style: Theme.of(context).textTheme.headline6),
          ),
          TextButton(
              onPressed: () async {
                Uri url = Uri.parse(data.url);
                await launchUrl(url);
              },
              child: const Text(
                "Read the full article here",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
