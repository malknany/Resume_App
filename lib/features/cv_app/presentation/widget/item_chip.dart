import '../../../../core/app_colors.dart';
import 'package:flutter/material.dart';

class ItemChip extends StatefulWidget {
  const ItemChip(
      {Key? key, required this.textEditingController, required this.values})
      : super(key: key);
  final TextEditingController textEditingController;
  final List<String> values;

  @override
  State<ItemChip> createState() => _ItemChipState();
}

class _ItemChipState extends State<ItemChip> {

  _onDelete(index) {
    setState(() {
      widget.values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                offset: const Offset(2, 4),
                blurRadius: 2,
              )
            ],
          ),
          child: TextFormField(
            onFieldSubmitted: (value) {
              setState(() {
                widget.values.add(value);
              });
            },
            controller: widget.textEditingController,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  widget.textEditingController.clear();
                },
                child: const Icon(
                  Icons.clear,
                  color:  AppColors.myindgo,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: const BorderSide(
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                      color:  AppColors.myindgo)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      strokeAlign: BorderSide.strokeAlignInside,
                      width: 1,
                      color: Colors.grey.shade600)),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 30, top: 15, bottom: 15),
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 5,
          children: List.generate(
              widget.values.length,
              (index) => _Chip(
                  label: widget.values[index],
                  onDeleted: _onDelete,
                  index: index)),
        )
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor:  AppColors.myindgo,
      labelStyle:
          const TextStyle(fontSize: 20, color: Colors.white),
      elevation: 0,
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
        color: Colors.white,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
