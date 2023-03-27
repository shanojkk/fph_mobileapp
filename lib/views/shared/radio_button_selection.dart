import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RadioButtonSelection extends StatefulWidget {
  const RadioButtonSelection({
    required this.items,
    required this.title,
    required this.onChanged,
    super.key,
  });
  final List<String> items;
  final String title;
  final ValueChanged<String?>? onChanged;

  @override
  State<RadioButtonSelection> createState() => _RadioButtonSelectionState();
}

class _RadioButtonSelectionState extends State<RadioButtonSelection> {
  late String val;

  @override
  void initState() {
    val = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height * 0.28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.01,
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.items.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: AppColors.neutral95,
                height: 0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.neutral95,
                    ),
                  ),
                  alignment: Alignment.center,
                  height: 48,
                  child: RadioListTile<String>(
                    dense: true,
                    tileColor: AppColors.neutral95,
                    title: Text(
                      widget.items[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    value: widget.items[index],
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: AppColors.primaryPallete,
                    groupValue: val,
                    onChanged: (value) {
                      val = value ?? "";
                      setState(() {});
                      if (widget.onChanged != null) {
                        widget.onChanged!(val);
                      }
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
