import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../constants/borders.dart';
import '../../../constants/colors.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.items,
      this.enableSearch = false,
      required this.controller,
      this.hintText = "Select an item",
      this.setState,
      this.label});
  final List<String> items;
  final String? label;
  final String hintText;
  final TextEditingController controller;
  final bool enableSearch;
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.white),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
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
            errorStyle: const TextStyle(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          minHeight: MediaQuery.of(context).size.height * 0.3,
        ),
        modalBottomSheetProps: const ModalBottomSheetProps(
          backgroundColor: CustomColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
