import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});

  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();

  // @override
  // void initState() {
  //   super.initState();
  // viewModel.getNews(widget.sourceId);

  //   // TODO: implement initState
  // }

  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, value, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          }
          final newsList = viewModel.newsList;
          return ListView.builder(
              itemBuilder: (context, index) => NewsItem(news: newsList[index]),
              itemCount: newsList.length);
        },
      ),
    );

    //   FutureBuilder(
    //   future: ApiService.getNews(sourceId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return LoadingIndicator();
    //     } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
    //       return const ErrorIndicator();
    //     }
    //     final newsList = snapshot.data?.news ?? [];
    //     return ListView.builder(
    //         itemBuilder: (context, index) => NewsItem(news: newsList[index]),
    //         itemCount: newsList.length);
    //   },
    // );
  }
}
