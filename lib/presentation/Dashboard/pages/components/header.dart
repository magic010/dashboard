import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Welcome Talia,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: RoundedSearchInput(
                      hintText: "Search",
                      textController: TextEditingController(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Color(0xff2749FD), width: 1.4)),
                        // padding: MaterialStateProperty.all(
                        //     const EdgeInsets.symmetric(
                        //         vertical: 20, horizontal: 50)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Sign Out",
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w300,
                                color: Color(0xff2749FD)),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff2749FD),
                            size: 15,
                          )
                        ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/exam.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class RoundedSearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const RoundedSearchInput(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500]!,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(45.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(45.0)),
          ),
        ),
      ),
    );
  }
}
