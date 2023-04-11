
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/post_model.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';

Widget postItem(BuildContext context, PostModel post) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                post.body,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black38),
              ),
            ),
            Column(
              children: [
                IconButton(onPressed: (){
                  BlocProvider.of<HomeBloc>(context).callUpdatePage(context, post);
                }, icon: const Icon(Icons.edit)),
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () async {
                      BlocProvider.of<HomeBloc>(context).add(DeletePostEvent(post: post));
                    },
                    icon: const Icon(Icons.delete)),
              ],
            )
          ],
        ),
        const Divider(
          thickness: 3,
        )
      ],
    ),
  );
}
