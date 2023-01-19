import 'package:flutter/material.dart';

class ExamBanner extends StatelessWidget {
  const ExamBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          image: DecorationImage(
            image: AssetImage("assets/images/exam.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GradientText(
                "Exams Time",
                gradient: LinearGradient(colors: [
                  Color(0xFF355262),
                  Color(0xFF3E8597),
                ]),
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                "Here we are, are you ready to fight?Don't worry, we prepared some tips to \nbe ready for your exam",
                style:
                    TextStyle(fontSize: 10, color: Colors.black87, height: 1.5),
              ),
              const Text(
                  "\"Nothing happens until something moves\" - Albert Einstein",
                  style:
                      TextStyle(fontSize: 7, color: Colors.black54, height: 2)),
              const Spacer(),
              SizedBox(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        gradient: const LinearGradient(
                            colors: [Color(0xFF355262), Color(0xFF3E8597)])),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            alignment: Alignment.center,
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    right: 10, left: 10, top: 10, bottom: 10)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                            )),
                        onPressed: () {},
                        child: const Text(
                          "View exams tips",
                          style:
                              TextStyle(color: Color(0xffffffff), fontSize: 16),
                        ))),
              )
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
