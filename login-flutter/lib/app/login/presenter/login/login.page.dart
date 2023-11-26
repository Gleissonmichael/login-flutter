import 'package:flutter/material.dart';
import 'package:login/app/login/domain/entities/dados-login.entity.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/shared/helpers/result.helper.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/launcher.service.dart';
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
  final LauncherService launcherService;
  final LoginStore store;
  final LoginUsecase loginUsecase;

  const LoginPage({
    Key? key,
    required this.modularService,
    required this.contextService,
    required this.launcherService,
    required this.store,
    required this.loginUsecase,
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
  String usernameError = '';
  String passwordError = '';
  bool showErrorMessage = false;

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
                    height: 220,
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
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 20,
                              ),
                              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(width: 1, color: ColorsTheme.mainSecondary),
                              ),
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
                          obscureText: true,
                          maxLength: 20,
                          cursorColor: ColorsTheme.mainSecondary,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                                size: 20,
                              ),
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(width: 1)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(width: 1, color: ColorsTheme.mainSecondary),
                              ),
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
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
                            usernameError,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            passwordError,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () => onSubmit(),
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20),
            child: GestureDetector(
              onTap: () => widget.launcherService.launch('https://www.google.com.br'),
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20),
                child: CustomText(
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  color: ColorsTheme.neutral10,
                  type: CustomTexts.paragraphXSmallRegular,
                  text: "Política de privacidade",
                ),
              ),
            ),
          )
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

  void onSubmit() async {
    if (_validateInputs()) {
      DadosLogin dados;

      dados = DadosLogin(
        username: widget.store.user.username,
        password: widget.store.user.username,
      );
      var loginResult = await widget.loginUsecase.login(dados);

      if (loginResult.isSuccess()) {
        // widget.modularService.pushNamed('/page');
      }
    } else {
      print('Login inválido');
    }
  }

  bool _validateInputs() {
    bool isValid = true;

    if (!hasUsernameText) {
      isValid = false;
      usernameError = 'Campo de usuário é obrigatório.';
    } else if (controllerUsername.text.length < 2 || controllerUsername.text.length > 20) {
      isValid = false;
      usernameError = 'O nome de usuário deve ter entre 2 e 20 caracteres.';
    } else if (controllerUsername.text.endsWith(' ')) {
      isValid = false;
      usernameError = 'O nome de usuário não pode terminar com um espaço.';
    } else {
      usernameError = '';
    }

    if (!hasPasswordText) {
      isValid = false;
      passwordError = 'Campo de senha é obrigatório.';
    } else if (controllerPassword.text.length < 2 || controllerPassword.text.length > 20) {
      isValid = false;
      passwordError = 'A senha deve ter entre 2 e 20 caracteres.';
    } else if (controllerPassword.text.endsWith(' ')) {
      isValid = false;
      passwordError = 'A senha não pode terminar com um espaço.';
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(controllerPassword.text)) {
      isValid = false;
      passwordError = 'A senha não pode conter caracteres especiais.';
    } else {
      passwordError = '';
    }

    setState(() {
      isInputValid = isValid;
    });

    return isValid;
  }

  bool get hasUsernameText => (controllerUsername.text).isNotEmpty;
  bool get hasPasswordText => (controllerPassword.text).isNotEmpty;
}
