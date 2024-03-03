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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tic_tac_toe_model.dart';
export 'tic_tac_toe_model.dart';

class TicTacToeWidget extends StatefulWidget {
  const TicTacToeWidget({super.key});

  @override
  State<TicTacToeWidget> createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget>
    with TickerProviderStateMixin {
  late TicTacToeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 80.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 140.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicTacToeModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                    child: PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      onPageChanged: (_) => setState(() {}),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Hero(
                                        tag: 'mainImage',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: Image.asset(
                                            'assets/images/TictacToe.png',
                                            width: 150.0,
                                            height: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Tic Tac Toe',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Rules',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.info_outline,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation']!),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 16.0),
                                        child: Text(
                                          '*Players take turns putting their marks in empty squares.\n\n* The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.\n\n* When all 9 squares are full, the game is over.\n\n* If no player has 3 marks in a row, the game ends in a tie.',
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 34.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: ['2', '3', '4'],
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue = val),
                                        width: 130.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintText: 'Select No. of Player',
                                        icon: Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: Color(0xFF95A1AC),
                                          size: 15.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderWidth: 2.0,
                                        borderRadius: 12.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 4.0, 8.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.dropDownValue == '2') {
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: DialogBoxWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          }

                                          setState(() {
                                            _model.counter = 0;
                                          });
                                          while (_model.counter < 9) {
                                            setState(() {
                                              _model.updateBoardAtIndex(
                                                _model.counter,
                                                (_) => '',
                                              );
                                            });
                                            setState(() {
                                              _model.counter =
                                                  _model.counter + 1;
                                            });
                                          }
                                          setState(() {
                                            _model.winner = '';
                                          });
                                          setState(() {
                                            _model.turn = 'X';
                                          });
                                          setState(() {
                                            _model.hasGameEnded = false;
                                          });
                                          setState(() {
                                            _model.isDraw = false;
                                          });
                                        },
                                        text: 'Start match',
                                        options: FFButtonOptions(
                                          width: 130.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 32.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 50.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25.0),
                                            bottomRight: Radius.circular(25.0),
                                            topLeft: Radius.circular(25.0),
                                            topRight: Radius.circular(25.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Container(
                              height: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 720.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Tic Tac Toe',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                    Text(
                                      () {
                                        if (_model.winner != null &&
                                            _model.winner != '') {
                                          return '${_model.winner} won the game';
                                        } else if (_model.isDraw == true) {
                                          return 'Game is Draw';
                                        } else {
                                          return '${_model.turn} player\'s turn';
                                        }
                                      }(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 20.0,
                                          ),
                                    ),
                                    Flexible(
                                      child: Builder(
                                        builder: (context) {
                                          final boardVariable =
                                              _model.board.toList();
                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  _model.dropDownValue == '2'
                                                      ? 3
                                                      : 3,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: boardVariable.length,
                                            itemBuilder:
                                                (context, boardVariableIndex) {
                                              final boardVariableItem =
                                                  boardVariable[
                                                      boardVariableIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((boardVariableItem ==
                                                              null ||
                                                          boardVariableItem ==
                                                              '') &&
                                                      (_model.hasGameEnded ==
                                                          false)) {
                                                    setState(() {
                                                      _model.updateBoardAtIndex(
                                                        boardVariableIndex,
                                                        (_) => _model.turn,
                                                      );
                                                    });
                                                  } else {
                                                    return;
                                                  }

                                                  if (_model.turn == 'X') {
                                                    setState(() {
                                                      _model.turn = 'O';
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.turn = 'X';
                                                    });
                                                  }

                                                  if ((_model.board[0] != null && _model.board[0] != '') &&
                                                      (_model.board[0] ==
                                                          _model.board[1]) &&
                                                      (_model.board[1] ==
                                                          _model.board[2])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[0];
                                                    });
                                                  } else if ((_model.board[3] != null && _model.board[3] != '') &&
                                                      (_model.board[3] ==
                                                          _model.board[4]) &&
                                                      (_model.board[4] ==
                                                          _model.board[5])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[3];
                                                    });
                                                  } else if ((_model.board[6] != null && _model.board[6] != '') &&
                                                      (_model.board[6] ==
                                                          _model.board[7]) &&
                                                      (_model.board[7] ==
                                                          _model.board[8])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[6];
                                                    });
                                                  } else if ((_model.board[0] != null && _model.board[0] != '') &&
                                                      (_model.board[0] ==
                                                          _model.board[3]) &&
                                                      (_model.board[3] ==
                                                          _model.board[6])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[0];
                                                    });
                                                  } else if ((_model.board[1] != null && _model.board[1] != '') &&
                                                      (_model.board[1] ==
                                                          _model.board[4]) &&
                                                      (_model.board[4] ==
                                                          _model.board[7])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[1];
                                                    });
                                                  } else if ((_model.board[2] != null && _model.board[2] != '') &&
                                                      (_model.board[2] ==
                                                          _model.board[5]) &&
                                                      (_model.board[5] ==
                                                          _model.board[8])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[2];
                                                    });
                                                  } else if ((_model.board[0] != null && _model.board[0] != '') &&
                                                      (_model.board[0] ==
                                                          _model.board[4]) &&
                                                      (_model.board[4] ==
                                                          _model.board[8])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[0];
                                                    });
                                                  } else if ((_model.board[2] != null &&
                                                          _model.board[2] != '') &&
                                                      (_model.board[2] == _model.board[4]) &&
                                                      (_model.board[4] == _model.board[6])) {
                                                    setState(() {
                                                      _model.winner =
                                                          _model.board[2];
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _model.counter = 0;
                                                    });
                                                    while (_model.counter < 9) {
                                                      if (_model.board[_model
                                                                  .counter] ==
                                                              null ||
                                                          _model.board[_model
                                                                  .counter] ==
                                                              '') {
                                                        return;
                                                      }

                                                      setState(() {
                                                        _model.counter =
                                                            _model.counter + 1;
                                                      });
                                                    }
                                                    setState(() {
                                                      _model.isDraw = true;
                                                    });
                                                  }

                                                  setState(() {
                                                    _model.hasGameEnded = true;
                                                  });
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        boardVariableItem,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              fontSize: 40.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          Icons.repeat,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 32.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.counter = 0;
                                          });
                                          while (_model.counter < 9) {
                                            setState(() {
                                              _model.updateBoardAtIndex(
                                                _model.counter,
                                                (_) => '',
                                              );
                                            });
                                            setState(() {
                                              _model.counter =
                                                  _model.counter + 1;
                                            });
                                          }
                                          setState(() {
                                            _model.winner = '';
                                          });
                                          setState(() {
                                            _model.turn = 'X';
                                          });
                                          setState(() {
                                            _model.hasGameEnded = false;
                                          });
                                          setState(() {
                                            _model.isDraw = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        count: 2,
                        axisDirection: Axis.horizontal,
                        onDotClicked: (i) async {
                          await _model.pageViewController!.animateToPage(
                            i,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        effect: smooth_page_indicator.ExpandingDotsEffect(
                          expansionFactor: 3.0,
                          spacing: 8.0,
                          radius: 16.0,
                          dotWidth: 16.0,
                          dotHeight: 8.0,
                          dotColor: FlutterFlowTheme.of(context).accent1,
                          activeDotColor: FlutterFlowTheme.of(context).primary,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
