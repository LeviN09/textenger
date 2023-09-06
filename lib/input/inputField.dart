import 'package:flutter/material.dart';

import '../style.dart';
import '../signin/cloud.dart';

class InputField extends StatefulWidget {
  final bool darkMode;
  final TextEditingController tec;
  final String group;

  InputField(this.darkMode, this.tec, this.group);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: Container(
              child: TextField(
                style: Style().lightText(false),
                controller: widget.tec,
              ),
              decoration: BoxDecoration(
                  color: Style().backLight,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(3),
            ),
            flex: 4,
          ),
          Flexible(
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if(widget.tec.text != null && widget.tec.text != "") {
                    Cloud().init(widget.tec.text, widget.group);
                    widget.tec.text = "";
                  }
                },
                child: Icon(Icons.play_arrow),
              ),
              width: double.infinity,
            ),
            flex: 1,
          )
        ],
      ),
      padding: EdgeInsets.only(left: 5, right: 5),
    );
  }
}
