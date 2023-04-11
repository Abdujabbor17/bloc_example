
import 'package:bloc_pattern/pages/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import '../model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadPostsEvent());
    homeBloc.stream.listen((state) {
      if (state is HomeDeletePostState) {
        homeBloc.add(LoadPostsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BloC"),
          actions: [
            IconButton(onPressed: (){
              homeBloc.callCreatePage(context);
            }, icon: const Icon(Icons.add))
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeErrorState) {
              return viewOfError(state.errorMessage);
            }

            if (state is HomePostListState) {
              return viewOfPostList( state.posts);
            }

            return viewOfLoading();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
           // homeBloc.callCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget viewOfError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfPostList(List<PostModel> items, ) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        return postItem(ctx, items[index], );
      },
    );
  }

}
