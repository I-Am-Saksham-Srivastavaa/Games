import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/dialog_box/dialog_box_widget.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'tic_tac_toe_widget.dart' show TicTacToeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TicTacToeModel extends FlutterFlowModel<TicTacToeWidget> {
  ///  Local state fields for this page.

  List<String> board = ['', '', '', '', '', '', '', '', ''];
  void addToBoard(String item) => board.add(item);
  void removeFromBoard(String item) => board.remove(item);
  void removeAtIndexFromBoard(int index) => board.removeAt(index);
  void insertAtIndexInBoard(int index, String item) =>
      board.insert(index, item);
  void updateBoardAtIndex(int index, Function(String) updateFn) =>
      board[index] = updateFn(board[index]);

  String turn = 'X';

  String? winner = '';

  int counter = 0;

  bool hasGameEnded = false;

  bool isDraw = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
