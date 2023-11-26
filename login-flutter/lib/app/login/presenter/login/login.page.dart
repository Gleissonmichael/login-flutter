import 'package:flutter/material.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/login.store.dart';
import 'package:login/shared/theme/colors.dart';
import 'package:login/shared/theme/font-size.style.dart';
import 'package:login/shared/theme/font-weight.style.dart';
import 'package:login/shared/theme/typography.dart';
import 'package:login/shared/widgets/custom-text/custom-text.widget.dart';

enum TypeInputField { text, search, restricted, email, cpf, numero, phone, cep, access, cnpj }

class LoginPage extends StatefulWidget {
  final ModularService modularService;
  final ContextService contextService;
  final LoginStore store;

  const LoginPage({
    Key? key,
    required this.modularService,
    required this.contextService,
    required this.store,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  late final FocusNode focus;
  bool isInputValid = true;
  bool isInputDisabled = false;

  @override
  void initState() {
    focus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.contextService.setRootBuildContext(context);

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFF1c4b5a), Color(0xFF319290)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          textAlign: TextAlign.start,
                          color: ColorsTheme.neutral10,
                          type: CustomTexts.paragraphMediumRegular,
                          text: "Usuário",
                        ),
                        TextFormField(
                          scrollPadding: EdgeInsets.zero,
                          controller: controllerUsername,
                          style: TypographyTheme.paragraphMediumRegular(
                              color: isInputDisabled ? ColorsTheme.neutral6 : ColorsTheme.neutral3),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (e) => onChangedUsername(text: e, isValid: isInputValid),
                          maxLines: 1,
                          maxLength: 20,
                          cursorColor: ColorsTheme.mainSecondary,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              // labelText: widget.label,
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeightTheme.regular,
                                  fontSize: FontSizeTheme.paragraphMediumRegular,
                                  fontStyle: FontStyle.normal,
                                  color: ColorsTheme.neutral6),
                              hintStyle: TypographyTheme.paragraphMediumRegular(
                                  color: ColorsTheme.neutral6),
                              fillColor: ColorsTheme.neutral8,
                              focusColor: ColorsTheme.neutral6,
                              filled: true,
                              counterText: ""),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: CustomText(
                            textAlign: TextAlign.start,
                            color: ColorsTheme.neutral10,
                            type: CustomTexts.paragraphMediumRegular,
                            text: "Senha",
                          ),
                        ),
                        TextFormField(
                          scrollPadding: EdgeInsets.zero,
                          controller: controllerPassword,
                          style: TypographyTheme.paragraphMediumRegular(
                              color: isInputDisabled ? ColorsTheme.neutral6 : ColorsTheme.neutral3),
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (e) => onChangedPassword(text: e, isValid: isInputValid),
                          maxLines: 1,
                          maxLength: 20,
                          cursorColor: ColorsTheme.mainSecondary,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              border: const UnderlineInputBorder(),
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeightTheme.regular,
                                  fontSize: FontSizeTheme.paragraphMediumRegular,
                                  fontStyle: FontStyle.normal,
                                  color: ColorsTheme.neutral6),
                              hintStyle: TypographyTheme.paragraphMediumRegular(
                                  color: ColorsTheme.neutral6),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: ColorsTheme.neutral8,
                              focusColor: ColorsTheme.neutral6,
                              filled: true,
                              counterText: ""),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 72, 165, 81),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text('Entrar')),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20),
            child: CustomText(
              textAlign: TextAlign.start,
              maxLines: 2,
              color: ColorsTheme.neutral10,
              type: CustomTexts.paragraphXSmallRegular,
              text: "Política de privacidade",
            ),
          ),
        ],
      ),
    ));
  }

  onChangedUsername({required String text, required bool isValid}) {
    widget.store.updateLogin(username: text);
    setState(() {
      isInputValid = !isValid;
    });
  }

  onChangedPassword({required String text, required bool isValid}) {
    widget.store.updateLogin(password: text);
    setState(() {
      isInputValid = !isValid;
    });
  }

  bool get hasUsernameText => (controllerUsername.text).isNotEmpty;
  bool get hasPasswordText => (controllerPassword.text).isNotEmpty;
}
