import 'package:flutter/material.dart';
import 'package:meu_gabarito/themes/styles/colors.dart';

ButtonStyle filledButtonStyle = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(primary),
  foregroundColor: MaterialStatePropertyAll(Colors.white),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);

ButtonStyle outlineButtonStyle = ButtonStyle(
  side: const MaterialStatePropertyAll(BorderSide(color: primary)),
  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
  foregroundColor: const MaterialStatePropertyAll(primary),
  overlayColor: MaterialStatePropertyAll(primary[50]),
  shape: const MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  padding: const MaterialStatePropertyAll(
    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
);

ButtonStyle textButtonStyle = ButtonStyle(
  foregroundColor: const MaterialStatePropertyAll(primary),
  overlayColor: MaterialStatePropertyAll(primary[50]),
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
);

ButtonStyle linkButtonStyle = textButtonStyle.copyWith(
  padding: const MaterialStatePropertyAll(EdgeInsets.all(2)),
  minimumSize: const MaterialStatePropertyAll(Size.zero),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

const floatingButtonThemeData = FloatingActionButtonThemeData(
  backgroundColor: (primary),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  ),
  foregroundColor: (Colors.white),
);

const cardMenuButtonStyle = ButtonStyle(
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: MaterialStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  ),
);

var deleteFilledButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.red[700]),
);
