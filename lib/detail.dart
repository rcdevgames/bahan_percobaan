import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_listing/bloc.dart';
import 'package:sample_listing/size_config.dart';
import 'package:sample_listing/state_2.dart';

class DetailWorker extends StatelessWidget {
  final int id;
  DetailWorker(this.id);

  Widget avatarName(String name) {
    var arr_name = name.split(" ");
    name = arr_name[0][0].toUpperCase();
    if (arr_name.length > 1) {
      name += arr_name[1][0].toUpperCase();
    }
    return Center(
      child: Text(name, style: TextStyle(fontSize: 25, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    DetailBloc bloc = BlocProvider.of<DetailBloc>(context);
    bloc.dispatch(id);
    
    return WillPopScope(
      onWillPop: () async {
        bloc.dispatch(0);
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detail Pekerja"),
        ),
        body: BlocBuilder<DetailBloc, SingleState>(
          builder: (ctx, state) {
            if (state is UndefinedSingle) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if (state is SingleLoaded) {
              return ListView(
                children: <Widget>[
                  Container(
                    height: SizeConfig.safeBlockVertical * 20,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: avatarName(state.data.workerName),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 70,
                    child: null,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}