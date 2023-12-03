// coverage:ignore-file

import 'package:flutter/material.dart';

class ContextService {
  late BuildContext _context;

  setRootBuildContext(BuildContext newContext) => _context = newContext;

  BuildContext get appRootBuildContext => _context;
}
