import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tezdainterview/common_widget/responsive.dart';
import '../utils/utils.dart';
import 'app_text.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? title;
  final bool? isTitle;
  final int? maxLines;
  final int? maxLength;
  final bool? suffixVisibility;
  final Function()? onTap;
  final Function()? prefixOnTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final Color? hintColor;
  final Color? underLineColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  bool obscureText;
  bool readOnly;

  CommonTextField({
    this.controller,
    this.inputFormatters,
    this.maxLength,
    this.contentPadding,
    this.onTap,
    this.maxLines,
    this.prefixIcon,
    this.underLineColor,
    this.suffixIcon,
    this.prefixOnTap,
    this.hintText,
    this.suffixVisibility = false,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.fillColor,
    this.hintColor,
    this.border,
    this.title,
    this.isTitle = true,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle!
            ? AppText(
                widget.title ?? "",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
            : SizedBox(),
        TextFormField(
          style: TextStyle(
            fontSize: responsiveText(14),
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          controller: widget.controller,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          onTap: widget.onTap,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            contentPadding:
                widget.contentPadding ?? EdgeInsets.symmetric(horizontal: responsiveWidth(15)),
            filled: true,
            fillColor: widget.fillColor ?? Colors.transparent,
            border: widget.border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.underLineColor ?? Color(0xff252525),
                  ),
                ),
            enabledBorder: widget.border ??
                UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: widget.underLineColor ?? Color(0xff252525),
                  ),
                ),
            focusedBorder: widget.border ??
                UnderlineInputBorder(
                  // borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: widget.underLineColor ?? Color(0xff252525),
                  ),
                ),
            counterText: "",
            prefixIcon: !utils.isValidationEmpty(widget.prefixIcon)
                ? Row(
                    children: [
                      GestureDetector(
                        onTap: widget.prefixOnTap,
                        child: SvgPicture.asset(
                          widget.prefixIcon!,
                        ),
                      ),
                      SizedBox(width: responsiveWidth(8)),
                      Container(
                        width: responsiveWidth(0.61),
                        height: responsiveHeight(17),
                        color: Colors.black,
                      )
                    ],
                  )
                : null,
            prefixIconConstraints: !utils.isValidationEmpty(widget.prefixIcon)
                ? BoxConstraints(maxWidth: responsiveWidth(35), maxHeight: responsiveHeight(35))
                : null,
            suffixIconConstraints:
                BoxConstraints(maxWidth: responsiveWidth(35), maxHeight: responsiveHeight(35)),
            suffixIcon: widget.suffixVisibility == false
                ? widget.suffixIcon
                : Visibility(
                    visible: widget.suffixVisibility!,
                    child: GestureDetector(
                      onTap: toggle,
                      child: Icon(
                        widget.obscureText ? Icons.visibility_off : Icons.visibility,
                        // height: responsiveHeight(15),
                        // width: responsiveWidth(15),
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: responsiveText(12),
              fontWeight: FontWeight.w400,
              color: widget.hintColor ?? Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
