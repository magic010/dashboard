import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../data/cubits/annoucements/annoucements_cubit.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
          // height: 200,
          width: double.infinity,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Announcements',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                child: const AnnouncementList(),
              ),
            ],
          )),
    );
  }
}

class AnnouncementList extends StatefulWidget {
  const AnnouncementList({
    Key? key,
  }) : super(key: key);

  @override
  State<AnnouncementList> createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnoucementsCubit, AnnoucementsState>(
      builder: (context, state) {
        if (state is AnnoucementsLoading) {
          return const Center(
            child: SpinKitThreeBounce(
              color: Colors.blue,
              size: 20,
            ),
          );
        }
        return state is AnnoucementsSuccess
            ? ListView.builder(
                itemCount: state.annoucements.data!.length,
                itemBuilder: (context, index) => AnnouncementCard(
                  announcer: state.annoucements.data![index].owner!.name!,
                  topic: state.annoucements.data![index].title!,
                  content: state.annoucements.data![index].description!,
                  image: "https://picsum.photos/200",
                ),
              )
            : const Center(
                child: Text('Error'),
              );
      },
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard(
      {super.key,
      required this.announcer,
      required this.topic,
      required this.content,
      required this.image});
  String announcer;
  String topic;
  String content;
  String image;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 8,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  announcer,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  topic,
                  style: const TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
            const VerticalDivider(
              width: 15,
              thickness: 5,
              indent: 8,
              endIndent: 8,
              color: Color.fromARGB(255, 8, 8, 8),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    content,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 7,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
