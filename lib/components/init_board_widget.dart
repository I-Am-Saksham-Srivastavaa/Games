import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'init_board_model.dart';
export 'init_board_model.dart';

class InitBoardWidget extends StatefulWidget {
  const InitBoardWidget({super.key});

  @override
  State<InitBoardWidget> createState() => _InitBoardWidgetState();
}

class _InitBoardWidgetState extends State<InitBoardWidget> {
  late InitBoardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitBoardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        final initNumList = functions.initBoard().toList();
        return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          scrollDirection: Axis.vertical,
          itemCount: initNumList.length,
          itemBuilder: (context, initNumListIndex) {
            final initNumListItem = initNumList[initNumListIndex];
            return FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: initNumListItem.toString(),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsets.all(12.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            );
          },
        );
      },
    );
  }
}
