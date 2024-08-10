// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// class CustomDropdown extends StatefulWidget {
//   final List<dynamic> items;
//   final String hintText;
//   final String? selectedValue;
//   final Function? function;
//   const CustomDropdown(
//       {super.key,
//       required this.items,
//       required this.hintText,
//       required this.selectedValue,
//       this.function});

//   @override
//   State<CustomDropdown> createState() => _CustomDropdownState();
// }

// class _CustomDropdownState extends State<CustomDropdown> {
//   String? selectedValue = '';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         isExpanded: true,
//         hint: Text(
//           'Select Item',
//           style: TextStyle(
//             fontSize: 14,
//             color: Theme.of(context).hintColor,
//           ),
//         ),
//         items: widget.items
//             .map((dynamic item) => DropdownMenuItem<String>(
//                   value: item.toString(),
//                   child: Text(
//                     item.toString(),
//                     style: const TextStyle(
//                       fontSize: 14,
//                     ),
//                   ),
//                 ))
//             .toList(),
//         value: selectedValue,
//         onChanged: (String? value) {
//           setState(() {
//             selectedValue = value;
//           });
//           widget.function;
//         },
//         buttonStyleData: const ButtonStyleData(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           height: 40,
//           width: 140,
//         ),
//         menuItemStyleData: const MenuItemStyleData(
//           height: 40,
//         ),
//       ),
//     );
//   }
// }
