import 'package:flutter/material.dart';

//
// class SearchInputField extends StatelessWidget {
//   final TextEditingController? controller;
//   final VoidCallback? onFilterTap;
//
//   const SearchInputField({super.key, this.controller, this.onFilterTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 48,
//               padding: const EdgeInsets.symmetric(horizontal: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.04),
//                     blurRadius: 6,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.search, color: Color(0xFF6C63FF)),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: TextField(
//                       controller: controller,
//                       decoration: const InputDecoration(
//                         hintText: 'Search...',
//                         border: InputBorder.none,
//                         hintStyle: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           ElevatedButton.icon(
//             onPressed: onFilterTap,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF6C63FF),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             ),
//             icon: const Icon(Icons.tune, size: 18, color: Colors.white),
//             label: const Text('Filters', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onFilterTap;

  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;

  final String hintText;

  const SearchInputField({
    super.key,
    this.controller,
    this.onFilterTap,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.hintText = 'Search...',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Color(0xFF6C63FF)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      readOnly: readOnly,
                      onTap: onTap,
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: onFilterTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6C63FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            icon: const Icon(Icons.tune, size: 18, color: Colors.white),
            label: const Text('Filters', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}