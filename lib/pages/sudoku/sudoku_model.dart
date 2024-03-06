import '/components/init_board_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/dialog_box/dialog_box_widget.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'sudoku_widget.dart' show SudokuWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SudokuModel extends FlutterFlowModel<SudokuWidget> {
  ///  Local state fields for this page.

  List<int> boardNumbers = [];
  void addToBoardNumbers(int item) => boardNumbers.add(item);
  void removeFromBoardNumbers(int item) => boardNumbers.remove(item);
  void removeAtIndexFromBoardNumbers(int index) => boardNumbers.removeAt(index);
  void insertAtIndexInBoardNumbers(int index, int item) =>
      boardNumbers.insert(index, item);
  void updateBoardNumbersAtIndex(int index, Function(int) updateFn) =>
      boardNumbers[index] = updateFn(boardNumbers[index]);

  int moves = 0;

  bool isStarted = false;

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
  // Stores action output result for [Custom Action - onClick] action in Button widget.
  dynamic? listMovesMap;
  // Stores action output result for [Custom Action - isSolved] action in Button widget.
  bool? isSolved;
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
