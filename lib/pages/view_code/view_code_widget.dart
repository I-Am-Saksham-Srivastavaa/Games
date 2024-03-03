import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/nav_bar/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_code_model.dart';
export 'view_code_model.dart';

class ViewCodeWidget extends StatefulWidget {
  const ViewCodeWidget({super.key});

  @override
  State<ViewCodeWidget> createState() => _ViewCodeWidgetState();
}

class _ViewCodeWidgetState extends State<ViewCodeWidget> {
  late ViewCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewCodeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            FlutterFlowWebView(
              content: 'https://github.com/I-Am-Saksham-Srivastavaa/Games',
              bypass: true,
              height: MediaQuery.sizeOf(context).height * 1.0,
              verticalScroll: false,
              horizontalScroll: false,
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navBarModel,
                updateCallback: () => setState(() {}),
                child: NavBarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
