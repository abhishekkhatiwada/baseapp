import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/constants/fonts.dart';
import 'package:baseapp/common/enum/textfield_type.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:baseapp/common/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends FormField<String> {
  CustomTextField({
    super.key,
    this.controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmited,
    String hintText = "",
    bool showSearchIcon = false,
    bool readOnly = false,
    TextFieldType type = TextFieldType.outline,
    String title = "",
    bool required = false,
    EdgeInsets? margin,
    TextInputType textInputType = TextInputType.text,
    IconData? suffixIcon,
    VoidCallback? onSuffixPressed,
    int? maxLength,
    double bottomMargin = 10,
    double horizontalMargin = CustomTheme.symmetricHozPadding,
    super.autovalidateMode,
    bool? enabled,
    super.onSaved,
    super.validator,
    super.restorationId,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    Widget? prefix,
    int maxLine = 1,
    double borderRadius = 15,
    Widget? trailingTitle,
    bool obscureText = false,
    double suffixIconSize = 28,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
  }) : super(
          enabled: enabled ?? true,
          initialValue: controller?.text ?? "",
          builder: (FormFieldState<String> field) {
            final _CustomTextFieldState state = field as _CustomTextFieldState;
            final InputDecoration effectiveDecoration = InputDecoration(
              counterText: "",
              hintText: hintText,
              prefix: prefix,
              hintStyle: const TextStyle(
                fontFamily: Fonts.inter,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: CustomTheme.midGrayColor,
              ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ).applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return Container(
              margin: margin ??
                  EdgeInsets.only(
                    bottom: bottomMargin,
                    left: horizontalMargin,
                    right: horizontalMargin,
                  ),
              child: UnmanagedRestorationScope(
                bucket: field.bucket,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              bottom:
                                  (trailingTitle != null || title.isNotEmpty)
                                      ? 10.hp
                                      : 0),
                          child: Row(
                            children: [
                              if (title.isNotEmpty)
                                RichText(
                                  text: TextSpan(
                                    text: title,
                                    style: const TextStyle(
                                      fontFamily: Fonts.inter,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      color: CustomTheme.lightGray,
                                    ),
                                    children: [
                                      if (required)
                                        const TextSpan(
                                          text: "*",
                                          style: TextStyle(
                                            fontFamily: Fonts.inter,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: CustomTheme.primaryColor,
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              const Spacer(),
                              if (trailingTitle != null) trailingTitle
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Row(
                            children: [
                              if (leading != null) leading,
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: type == TextFieldType.filled
                                        ? CustomTheme.lightGray
                                        : Colors.transparent,
                                    borderRadius:
                                        BorderRadius.circular(borderRadius),
                                    border: type == TextFieldType.outline
                                        ? Border.all(
                                            width: 1,
                                            color: CustomTheme.gray,
                                          )
                                        : null,
                                  ),
                                  padding: EdgeInsets.only(
                                    left: CustomTheme.symmetricHozPadding,
                                    right: showSearchIcon
                                        ? 0
                                        : CustomTheme.symmetricHozPadding,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          obscureText: obscureText,
                                          restorationId: restorationId,
                                          controller:
                                              state._effectiveController,
                                          decoration: effectiveDecoration,
                                          keyboardType: textInputType,
                                          maxLength: maxLength,
                                          onChanged: onChangedHandler,
                                          textInputAction: textInputAction,
                                          enableInteractiveSelection: !readOnly,
                                          readOnly: readOnly,
                                          maxLines: maxLine,
                                          inputFormatters: inputFormatters,
                                          cursorColor: CustomTheme.gray,
                                          onEditingComplete: () {
                                            FocusScope.of(field.context)
                                                .unfocus();
                                            if (onSubmited != null) {
                                              onSubmited(
                                                  controller?.text ?? "");
                                            }
                                          },
                                          onTap: onTap,
                                          style: const TextStyle(
                                            fontFamily: Fonts.inter,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: CustomTheme.primaryTextColor,
                                          ),
                                        ),
                                      ),
                                      if (showSearchIcon)
                                        CustomIconButton(
                                          backgroundColor: Colors.transparent,
                                          icon: suffixIcon ?? Icons.search,
                                          shadow: false,
                                          iconSize: suffixIconSize,
                                          iconColor: CustomTheme.midGrayColor,
                                          onPressed: onSuffixPressed,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (trailing != null) trailing,
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (state.hasError)
                      Container(
                        padding: EdgeInsets.only(top: 4.hp),
                        child: Text(
                          state.errorText!,
                          style: const TextStyle(
                            fontFamily: Fonts.inter,
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() {
    return _CustomTextFieldState();
  }
}

class _CustomTextFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  CustomTextField get widget => super.widget as CustomTextField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
