import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safeloan/app/modules/User/education/controllers/education_controller.dart';
import 'package:safeloan/app/modules/User/education/models/article_model.dart';
import 'package:safeloan/app/utils/warna.dart';
import 'package:safeloan/app/widgets/button_back_leading.dart';

class DetailArticlePage extends StatefulWidget {
  final Article article;
  const DetailArticlePage({super.key, required this.article});

  @override
  _DetailArticlePageState createState() => _DetailArticlePageState();
}

class _DetailArticlePageState extends State<DetailArticlePage> {
  Timer? _timer;
  bool _hasMarkedAsRead = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(Duration(seconds: 10), () async {
      if (!_hasMarkedAsRead) {
        final educationController = Get.find<EducationController>();
        final userId = FirebaseAuth.instance.currentUser!.uid;
        await educationController.markArticleAsRead(widget.article.id, userId);
        setState(() {
          _hasMarkedAsRead = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edukasi", style: Utils.header,),
        leading: const ButtonBackLeading()
      ),
      body: ListView(
        children: [
          // Gambar Artikel
          widget.article.image.isNotEmpty
              ? Image.network(
                  widget.article.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.error, color: Colors.grey[500]),
                    );
                  },
                )
              : Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey[500]),
                ),
          // Judul Artikel
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(widget.article.title,
                style: Utils.titleStyle
            ),
          ),
          // Sumber Artikel
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 20.0),
            child: Text("Sumber : ${widget.article.source}",
                style: Utils.subtitle)
          ),
          const SizedBox(height: 16),
          // Konten Artikel
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.article.content,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
