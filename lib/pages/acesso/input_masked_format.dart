import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//@Author Ismael Alves
class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator1;
  final String separator2;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator1,
    @required this.separator2
  }) { assert(mask != null); assert (separator1 != null); assert (separator2 != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
          if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator2){
            return TextEditingValue(
              text: '${oldValue.text}$separator2${newValue.text.substring(newValue.text.length-1)}',
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ),
            );
          }
          if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator1) {
            print(oldValue);
            return TextEditingValue(
              text: '${oldValue.text}$separator1${newValue.text.substring(newValue.text.length-1)}',
              selection: TextSelection.collapsed(
                offset: newValue.selection.end + 1,
              ),
            );
          }
      }
    }
    return newValue;
  }
}