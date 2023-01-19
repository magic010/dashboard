import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../data/cubits/quizes/quizes_cubit.dart';
import 'banner.dart';

class UpcomingExams extends StatefulWidget {
  const UpcomingExams({super.key});

  @override
  State<UpcomingExams> createState() => _UpcomingExamsState();
}

class _UpcomingExamsState extends State<UpcomingExams> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<QuizesCubit>().getQuizes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.20,
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
        child: BlocConsumer<QuizesCubit, QuizesState>(
          listener: (context, state) {
            if (state is QuizesFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }

            if (state is QuizesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Quizes Loaded'),
                ),
              );
            }

            if (state is QuizesLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Loading Quizes'),
                ),
              );
            }
          },
          builder: (context, state) {
            {
              if (state is QuizesSuccess) {
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'What\'s Due',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            child: GradientText("All",
                                gradient: LinearGradient(colors: [
                                  Color(0xFF355262),
                                  Color(0xFF3E8597)
                                ]),
                                style: TextStyle(
                                  fontSize: 10,
                                )),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.quizes.data?.length,
                        itemBuilder: (context, index) => ExamCard(
                            examName: state.quizes.data![index].name!,
                            course: state.quizes.data![index].course!,
                            topic: state.quizes.data![index].topic!,
                            examTime:
                                state.quizes.data![index].dueDate!.toString()),
                      ),
                    ),
                  ],
                );
              }
              if (state is QuizesLoading) {
                return const Center(
                  child: SpinKitThreeBounce(
                    color: Colors.blue,
                    size: 20,
                  ),
                );
              }
              if (state is QuizesFailure) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount:
                      state is QuizesSuccess ? state.quizes.data?.length : 0,
                  itemBuilder: (context, index) => ExamCard(
                      examName: state is QuizesSuccess
                          ? state.quizes.data![index].name!
                          : "",
                      course: state is QuizesSuccess
                          ? state.quizes.data![index].course!
                          : "",
                      topic: state is QuizesSuccess
                          ? state.quizes.data![index].topic!
                          : "",
                      examTime: state is QuizesSuccess
                          ? state.quizes.data![index].dueDate!.toString()
                          : ""),
                ),
              );
            }
          },
        ));
  }
}

class ExamCard extends StatelessWidget {
  ExamCard(
      {super.key,
      required this.examName,
      required this.course,
      required this.topic,
      required this.examTime});
  String examName;
  String course;
  String topic;
  String examTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            examName,
            style: const TextStyle(fontSize: 10, color: Colors.black45),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "course: $course",
            style: const TextStyle(fontSize: 7, color: Colors.black45),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "topic:   $topic",
            style: const TextStyle(fontSize: 7, color: Colors.black45),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Due to: $examTime",
            style: const TextStyle(fontSize: 7, color: Colors.black45),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: OutlinedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.center,
                  side: MaterialStateProperty.all(
                      const BorderSide(width: 1, color: Colors.green)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
              onPressed: () {},
              child: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.green, fontSize: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}
