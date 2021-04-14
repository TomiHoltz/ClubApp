import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/screens/journalist_home.dart';
import 'package:arg_msjz/Journalists/ui/screens/journalist_signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HandleJournalistSignIn extends StatefulWidget {
  @override
  _HandleJournalistSignInState createState() => _HandleJournalistSignInState();
}

class _HandleJournalistSignInState extends State<HandleJournalistSignIn> {
  JournalistBloc journalistBloc;

  @override
  Widget build(BuildContext context) {
    journalistBloc = BlocProvider.of<JournalistBloc>(context);
    return handleSignInSession();
  }

  Widget handleSignInSession() {
    return StreamBuilder(
      stream: journalistBloc.getCurrentUser,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return JournalistSignInScreen();
        } else {
          return JournalistHome();
        }
      },
    );
  }
}
