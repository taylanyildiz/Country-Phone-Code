import 'package:country_picker/src/utils.dart' as utils;
import 'package:country_picker/src/res/country_codes.dart' as code;
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPhoneTextField extends StatefulWidget {
  CountryPhoneTextField({
    Key? key,
    this.textController,
    this.onChange,
    this.validator,
    this.onCountry,
    this.focusNode,
    this.exclude,
    this.hintText,
    Color? fillColor,
    Color? iconColor,
    Color? prefixColor,
    TextStyle? style,
    TextStyle? codeStyle,
    String? initialCountryCode,
    double? padding,
    double? height,
    double? flagSize,
    double? iconSize,
    int? maxLength,
  })  : fillColor = fillColor ?? Colors.white,
        padding = padding ?? 20.0,
        height = height ?? 50.0,
        initialCountryCode = initialCountryCode ?? 'TR',
        maxLength = maxLength ?? 20,
        iconColor = iconColor ?? Colors.black,
        prefixColor = prefixColor ?? Colors.grey,
        flagSize = flagSize ?? 22.0,
        iconSize = iconSize ?? 25.0,
        codeStyle = codeStyle ??
            TextStyle(
              color: Colors.black45,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
        style = style ??
            TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
        super(key: key);

  /// Phone input controller [TextEditingController]
  final TextEditingController? textController;

  /// [TextEditingController].addListener
  final Function(String?)? onChange;

  /// Phone input validator for error
  final String? Function(String?)? validator;

  /// return select country
  final Function(Country? country)? onCountry;

  /// Focusnode for request
  final FocusNode? focusNode;

  /// Country is like 'TR' for TURKEY.
  final String initialCountryCode;

  /// Exclude: Can be used to exclude(remove) one or more country
  /// from the countries list (optional).
  final List<String>? exclude;

  /// Input phone hintText.
  final String? hintText;

  /// Background color
  final Color fillColor;

  /// Select country icon color
  final Color iconColor;

  /// Prefix icon color [phone]
  final Color prefixColor;

  /// Style of input phone
  final TextStyle style;

  /// Style of country phone code
  final TextStyle codeStyle;

  /// Horizontal padding [double]
  final double padding;

  /// height total widget
  final double height;

  /// Selected and inital Country flag size
  final double flagSize;

  /// Select icon size
  final double iconSize;

  /// max length imput phone
  final int maxLength;

  @override
  _CountryPhoneTextFieldState createState() => _CountryPhoneTextFieldState();
}

class _CountryPhoneTextFieldState extends State<CountryPhoneTextField> {
  late Country _initalCountry;
  late List<Country> _countryList;
  @override
  void initState() {
    _countryList = code.countryCodes.map((e) => Country.from(json: e)).toList();
    int index = _countryList.indexWhere(
        (element) => element.countryCode == widget.initialCountryCode);
    if (index != -1) {
      _initalCountry = _countryList[index];
    }
    super.initState();
  }

  void onSelectCountry(context) {
    showCountryPicker(
      context: context,
      exclude: widget.exclude,
      onSelect: (country) {
        _initalCountry = country;
        widget.onCountry?.call(country);
        setState(() {});
      },
      showPhoneCode: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.padding),
      padding: EdgeInsets.only(left: 10.0),
      width: width,
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectCountry(context),
          divider,
          showCountryPhoneCode,
          textField,
        ],
      ),
    );
  }

  Widget get divider => Container(
        color: Colors.black12,
        width: 2.0,
        height: widget.height - widget.padding / 2,
      );

  Widget get showCountryPhoneCode => Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Text(
          '(+${_initalCountry.phoneCode})',
          style: widget.codeStyle,
        ),
      );

  Widget selectCountry(context) => GestureDetector(
        onTap: () => onSelectCountry(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showCountryFlag,
            selectCountryIcon,
          ],
        ),
      );

  Widget get showCountryFlag => Text(
        utils.Utils.countryCodeToEmoji(_initalCountry.countryCode),
        style: TextStyle(fontSize: widget.flagSize),
      );

  Widget get selectCountryIcon => Icon(Icons.keyboard_arrow_down,
      color: widget.iconColor, size: widget.iconSize);

  Widget get textField => Expanded(
        child: TextFormField(
          controller: widget.textController,
          validator: widget.validator,
          onChanged: widget.onChange,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          style: widget.style,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            hintText: widget.hintText,
            counterText: '',
            suffixIcon: Icon(Icons.phone, color: widget.prefixColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      );
}
