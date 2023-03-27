import 'package:flutter/material.dart';

class GenderRadioButtons extends StatefulWidget {
  const GenderRadioButtons({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  State<GenderRadioButtons> createState() => _GenderRadioButtonsState();
}

class _GenderRadioButtonsState extends State<GenderRadioButtons> {
  late String radioValue;

  @override
  void initState() {
    radioValue = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  value: "Male",
                  groupValue: radioValue,
                  onChanged: (value) {
                    radioValue = value!;
                    widget.onChanged(radioValue);
                    setState(() {});
                  }),
              const Expanded(
                child: Text('Male'),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  value: "female",
                  groupValue: radioValue,
                  onChanged: (value) {
                    radioValue = value!;
                    widget.onChanged(radioValue);
                    setState(() {});
                  }),
              const Expanded(child: Text('Female'))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                  value: "other",
                  groupValue: radioValue,
                  onChanged: (value) {
                    radioValue = value!;
                    widget.onChanged(radioValue);
                    setState(() {});
                  }),
              const Expanded(child: Text('Other'))
            ],
          ),
        ),
      ],
    );
  }
}
