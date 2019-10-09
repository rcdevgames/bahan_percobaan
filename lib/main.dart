import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indonesia/indonesia.dart';
import 'package:sample_listing/bloc.dart';
import 'package:sample_listing/model.dart';
import 'package:sample_listing/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) => ListBloc(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {

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
    ListBloc bloc = BlocProvider.of<ListBloc>(context);
    bloc.dispatch(1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Karyawan HS"),
      ),
      body: BlocBuilder<ListBloc, Model>(
        builder: (ctx, worker) {
          if (worker is UndefinedModel) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.80),
            itemCount: worker.data.length,
            itemBuilder: (ctx, i) => Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          color: Theme.of(context).primaryColor,
                          height: SizeConfig.safeBlockVertical * 20,
                          width: double.infinity,
                          child: avatarName(worker.data[i].workerName),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 20,
                          width: double.infinity,
                          // child: Image.network(worker.data[i].workerProfile, fit: BoxFit.cover, alignment: AlignmentDirectional.topCenter)
                          child: CachedNetworkImage(
                            imageUrl: worker.data[i].workerProfile,
                            placeholder: (ctx, id) => avatarName(worker.data[i].workerName),
                            errorWidget: (ctx, id, o) => avatarName(worker.data[i].workerName),
                            fit: BoxFit.cover,
                            alignment: AlignmentDirectional.topCenter,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("${worker.data[i].workerName} (${worker.data[i].workerAge})", textAlign: TextAlign.center),
                    Text(worker.data[i].districtName, style: TextStyle(fontSize: 10)),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(rupiah(worker.data[i].workerSalary), style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                        RatingBarIndicator(
                          rating: double.parse(worker.data[i].workerRating),
                          itemSize: 13,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}