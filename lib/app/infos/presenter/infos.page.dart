import 'package:flutter/material.dart';
import 'package:login/app/infos/infos.store.dart';
import 'package:login/app/login/domain/usecase/login.usecase.dart';
import 'package:login/shared/services/context.service.dart';
import 'package:login/shared/services/launcher.service.dart';
import 'package:login/shared/services/modular.service.dart';
import 'package:login/shared/stores/store.states.dart';
import 'package:login/shared/theme/colors.dart';
import 'package:login/shared/theme/font-size.style.dart';
import 'package:login/shared/theme/font-weight.style.dart';
import 'package:login/shared/theme/typography.dart';
import 'package:login/shared/widgets/custom-text/custom-text.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfosPage extends StatefulWidget {
  final ModularService modularService;
  final ContextService contextService;
  final LauncherService launcherService;
  final InfosStore store;
  final LoginUsecase loginUsecase;

  const InfosPage({
    Key? key,
    required this.modularService,
    required this.contextService,
    required this.launcherService,
    required this.store,
    required this.loginUsecase,
  }) : super(key: key);

  @override
  State<InfosPage> createState() => _InfosPageState();
}

class _InfosPageState extends State<InfosPage> with SingleTickerProviderStateMixin {
  TextEditingController controllerText = TextEditingController();
  late SharedPreferences prefs;
  late final FocusNode focus;
  bool isInputDisabled = false;
  int? indexList;

  @override
  void initState() {
    focus = FocusNode();
    loadInfos();
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  loadInfos() async {
    widget.store.infosState = const DataLoadedState([]);
    prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.store.infosState = DataLoadedState(prefs.getStringList('items') ?? []);
    });
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 300,
                          width: 400,
                          color: Colors.white,
                          child: ListView.builder(
                              itemCount: widget.store.infosState.getLoadedData().length,
                              itemBuilder: (BuildContext context, int index) {
                                return card(widget.store.infosState.getLoadedData()[index], index);
                              }),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          focusNode: focus,
                          scrollPadding: EdgeInsets.zero,
                          controller: controllerText,
                          autovalidateMode: AutovalidateMode.always,
                          style: TypographyTheme.paragraphMediumRegular(
                              color: isInputDisabled ? ColorsTheme.neutral6 : ColorsTheme.neutral3),
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 1,
                          cursorColor: ColorsTheme.mainSecondary,
                          onFieldSubmitted: (value) {
                            onSubmit(value);
                          },
                          decoration: InputDecoration(
                              label: const Padding(
                                padding: EdgeInsets.only(bottom: 40.0),
                                child: CustomText(
                                  type: CustomTexts.headingSmall,
                                  text: 'Digite seu texto',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
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
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
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

  Widget card(String data, int index) {
    return Card(
        child: ListTile(
      title: Text(data),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              indexList = index;
              controllerText.text = widget.store.infosState.getLoadedData()[index];
            },
          ),
          IconButton(
              icon: const Icon(Icons.close),
              color: const Color.fromARGB(255, 206, 24, 11),
              onPressed: () {
                indexList = index;
                showConfirmationDialog(context);
              }),
        ],
      ),
    ));
  }

  Future<void> showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Você tem certeza que deseja realizar esta ação?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _performAction();
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  void onSubmit(String value) async {
    List<String> newList = [];
    newList = prefs.getStringList('items') ?? [];

    setState(() {
      if (indexList != null) {
        newList[indexList!] = value;
      } else {
        newList.add(value);
      }
      widget.store.infosState = DataLoadedState(newList);
    });
    _saveListToPrefs(newList);
    controllerText.text = '';
    indexList = null;
  }

  void _performAction() async {
    if (indexList != null) {
      _removeItemAtIndex(indexList!);
    }
  }

  void _removeItemAtIndex(int index) {
    List<String> newList = widget.store.infosState.getLoadedData();

    if (index >= 0 && index < newList.length) {
      newList.removeAt(index);

      setState(() {
        widget.store.infosState = DataLoadedState(newList);
      });

      _saveListToPrefs(newList);
    }
  }

  Future<void> _saveListToPrefs(List<String> list) async {
    await prefs.setStringList('items', list);
  }
}
