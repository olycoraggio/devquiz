import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answers;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled;

  const AnswerWidget({
    Key? key,
    required this.answers,
    required this.onTap,
    this.isSelected = false, this.disabled = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answers.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answers.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answers.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answers.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answers.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      answers.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: IgnorePointer(
        ignoring: disabled,
              child: GestureDetector(
          onTap: onTap,
                child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedBorderCardRight : AppColors.border,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answers.title,
                    style:
                        isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                  ),
                ),
                Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isSelected ? _selectedColorRight : AppColors.white,
                      borderRadius: BorderRadius.circular(500),
                      border: Border.fromBorderSide(
                        BorderSide(
                          color:
                              isSelected ? _selectedBorderRight : AppColors.border,
                        ),
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            _selectedIconRight,
                            size: 16,
                            color: Colors.white,
                          )
                        : null),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
