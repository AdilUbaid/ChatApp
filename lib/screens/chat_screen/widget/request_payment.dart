import 'package:chitchat/screens/constants.dart';
import 'package:flutter/material.dart';

class RequestPayment extends StatelessWidget {
  const RequestPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Requesting payment"),
      content: const TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.currency_rupee_rounded),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          hintText: 'Enter amount',
        ),
      ),
      // actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        // TextButton(
        //     style: ButtonStyle(
        //         backgroundColor:
        //             MaterialStateProperty.all(Colors.green.shade400)),
        //     onPressed: () {},
        //     child: const Text(
        //       'Accept',
        //       style: TextStyle(color: whiteColor),
        //     )),
        // TextButton(
        //     style: ButtonStyle(
        //         backgroundColor:
        //             MaterialStateProperty.all(Colors.red.shade400)),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Text(
        //       'Decline',
        //       style: TextStyle(color: whiteColor),
        //     ))
        TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.orange.shade400)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Request',
              style: TextStyle(color: whiteColor),
            ))
      ],
    );
  }
}
