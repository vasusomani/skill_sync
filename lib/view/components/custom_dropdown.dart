import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../constants/borders.dart';
import '../../constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.items,
      this.enableSearch = false,
      required this.controller,
      this.setState});
  final List<String> items;
  final TextEditingController controller;
  final bool enableSearch;
  //pass setState
  final VoidCallback? setState;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      items: items,
      onChanged: (value) {
        controller.text = value;
        if (setState != null) {
          setState!();
        }
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
        dropdownSearchDecoration: InputDecoration(
          hintText: "Select occupation",
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.white),
          suffixIconColor: Colors.white,
          enabledBorder: CustomBorders().enabled,
          focusedBorder: CustomBorders().focused,
          errorBorder: CustomBorders().error,
          focusedErrorBorder: CustomBorders().focusedError,
        ),
      ),
      popupProps: PopupProps.modalBottomSheet(
        listViewProps: const ListViewProps(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          physics: BouncingScrollPhysics(),
        ),
        itemBuilder: (context, dynamic item, bool isSelected) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              item,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white, fontSize: 18),
            ),
          );
        },
        searchFieldProps: TextFieldProps(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search here",
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: const Icon(Icons.search, color: Colors.white),
            enabledBorder: CustomBorders().enabled,
            focusedBorder: CustomBorders().focused,
            errorBorder: CustomBorders().error,
            focusedErrorBorder: CustomBorders().focusedError,
          ),
        ),
        showSearchBox: true,
        searchDelay: const Duration(milliseconds: 1),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          minHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        modalBottomSheetProps: ModalBottomSheetProps(
          backgroundColor: CustomColors.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
