import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class BiometricoWidget extends StatefulWidget {
  const BiometricoWidget({Key? key}) : super(key: key);

  @override
  _BiometricoWidgetState createState() => _BiometricoWidgetState();
}

class _BiometricoWidgetState extends State<BiometricoWidget> {
  bool resultado = false;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    final _localAuth = LocalAuthentication();
                    bool _isBiometricSupported =
                        await _localAuth.isDeviceSupported();

                    if (_isBiometricSupported) {
                      resultado = await _localAuth.authenticate(
                          localizedReason: 'coloca tu huella dijital');
                      setState(() {});
                    }

                    if (resultado!) {
                      context.pushNamed('inicio1');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'resultado',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0x00000000),
                        ),
                      );
                    }

                    setState(() {});
                  },
                  child: Icon(
                    Icons.login,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
