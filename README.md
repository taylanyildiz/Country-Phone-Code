# select_country_code_phone


<img src = "https://user-images.githubusercontent.com/37551474/132737505-532ee6f7-564f-4a06-a099-27ee1de0a3c4.gif" width="200">



- for locale language change
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations: # Add this line
    sdk: flutter         # Add this line
```

- for country picke
```yaml
country_picker: ^2.0.7
```

- add material app this 

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
```
- MaterialApp

```dart
return const MaterialApp(
  title: 'Localizations Sample App',
 supportedLocales: [
    const Locale('en'),
    const Locale('el'),
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
    const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
    ],
    localizationsDelegates: [
    CountryLocalizations.delegate,
    Locale('es', ''), // Spanish, no country code
  ],
  home: HomeScreen(),
);
```

## Country Phone Textfield

### Example

```dart
CountryPhoneTextField(
    fillColor: Colors.white,
    initialCountryCode: 'TR',
    exclude: ['EN', 'FR'],
    onCountry: (country) {
    log(country!.countryCode);
    },
)
```


# Usage 


### Phone input controller [TextEditingController]
- textController

### input validator for error
- Function(String?)? validator;

### return select country
- Function(Country? country)? onCountry;

### Focusnode for request
- FocusNode? focusNode;

### Country is like 'TR' for TURKEY.
- initialCountryCode;

### Exclude: Can be used to exclude(remove) one or more country
### from the countries list (optional).
- List<String>? exclude;

### Input phone hintText.
- String? hintText;

### Background color
- Color fillColor;

### Style of input phone
- TextStyle style;

### Style of country phone code
- TextStyle codeStyle;

### countryListTheme: Can be used to customize the country 
### list's bottom sheet and widgets that lie within it. (optional).
- final CountryListThemeData? countryListTheme;

### Horizontal padding
- double padding;

### height total widget
- double height;

### Selected and inital Country flag size
- double flagSize;

### Select icon size
- double iconSize;

### Max length imput phone
- int maxLength;
