import 'package:flutter/material.dart';
import 'package:news_app/sources/view/widgets/sources_tabs.dart';
import 'package:news_app/sources/view_model/sources_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  int repeat =0;
  // final SourcesViewModel viewModel2=Provider.of<SourcesViewModel>(context);
// @override
  void initState() {
  viewModel.getSource(widget.categoryId).then((value) {setState(() {
    
  });});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final controller=TabController(length: length, vsync: vsync);
      // viewModel.getSource(widget.categoryId).then((value) {setState(() {
        
      // });});
    // controller.
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder( 
  
        builder: (context) {
         repeat++;
         print('bakkar is${repeat} ');
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessege != null) {
            return const ErrorIndicator();
          }
          return SourcesTabs(sources: viewModel.sources);
        },
      ),

      // Consumer<SourcesViewModel>(
      //   builder: (_,viewModel,__) {
      //     if (viewModel.isLoading) {
      //       return LoadingIndicator();
      //     } else if (viewModel.errorMessege != null) {
      //       return  ErrorIndicator(viewModel.errorMessege!);
      //     }
      //     return SourcesTabs(sources: viewModel.sources);
      //   },
      // ),
    );
    //   FutureBuilder(
    //   future: ApiService.getSources(categoryId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return LoadingIndicator();
    //     } else if (snapshot.hasError) {
    //       return const ErrorIndicator();
    //     } else if (snapshot.data?.status != 'ok') {
    //       return const ErrorIndicator();
    //     }
    //     final sources = snapshot.data?.sources ?? [];
    //     return SourcesTabs(sources: sources);
    //   },
    // );
  }
}
