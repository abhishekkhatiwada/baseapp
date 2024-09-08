import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/constants/fonts.dart';
import 'package:baseapp/common/enum/textfield_type.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends FormField<String> {
  PhoneTextField({
    super.key,
    this.controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmited,
    String hintText = "",
    bool readOnly = false,
    TextFieldType type = TextFieldType.outline,
    String title = "",
    bool required = false,
    EdgeInsets? margin,
    TextInputType textInputType = TextInputType.text,
    int? maxLength,
    double bottomMargin = 10,
    double horizontalMargin = CustomTheme.symmetricHozPadding,
    super.autovalidateMode,
    bool? enabled,
    super.onSaved,
    super.validator,
    super.restorationId,
    VoidCallback? onTap,
    String countryCode = "+977",
    TextInputAction textInputAction = TextInputAction.done,
  }) : super(
          enabled: enabled ?? true,
          initialValue: controller?.text ?? "",
          builder: (FormFieldState<String> field) {
            final PhoneTextFieldState state = field as PhoneTextFieldState;
            final InputDecoration effectiveDecoration = InputDecoration(
              counterText: "",
              hintText: hintText,
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
                        if (title.isNotEmpty)
                          Container(
                            padding: EdgeInsets.only(bottom: 10.hp),
                            child: RichText(
                              text: TextSpan(
                                text: title,
                                style: const TextStyle(
                                  fontFamily: Fonts.inter,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: CustomTheme.primaryTextColor,
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
                          ),
                        GestureDetector(
                          onTap: onTap,
                          child: Container(
                            decoration: BoxDecoration(
                              color: type == TextFieldType.filled
                                  ? CustomTheme.lightGray
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: type == TextFieldType.outline
                                  ? Border.all(
                                      width: 1,
                                      color: CustomTheme.gray,
                                    )
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        countryCode,
                                        style: const TextStyle(
                                          fontFamily: Fonts.inter,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: CustomTheme.lightGray,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 10.hp,
                                        ),
                                        height: 25.0,
                                        width: 1.0,
                                        color: CustomTheme.midGrayColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    restorationId: restorationId,
                                    controller: state._effectiveController,
                                    decoration: effectiveDecoration,
                                    keyboardType: textInputType,
                                    maxLength: maxLength,
                                    onChanged: onChangedHandler,
                                    enableInteractiveSelection: !readOnly,
                                    readOnly: readOnly,
                                    cursorColor: CustomTheme.gray,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    onEditingComplete: () {
                                      FocusScope.of(field.context).unfocus();
                                      if (onSubmited != null) {
                                        onSubmited(controller?.text ?? "");
                                      }
                                    },
                                    textInputAction: textInputAction,
                                    onTap: onTap,
                                    style: const TextStyle(
                                      fontFamily: Fonts.inter,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: CustomTheme.primaryTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
    return PhoneTextFieldState();
  }
}

class PhoneTextFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  PhoneTextField get widget => super.widget as PhoneTextField;

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
  void didUpdateWidget(PhoneTextField oldWidget) {
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
