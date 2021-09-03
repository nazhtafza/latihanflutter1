import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/RestaurantModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  void initState() {
    super.initState();
    loadFormJson();
  }

  bool isloading = true;
  late RestaurantModel restaurantModel;

  void loadFormJson() async {
    final res =
        await http.get(Uri.parse("https://restaurant-api.dicoding.dev/list"));
    if (res.statusCode == 200) {
      print("hasil : " + res.body.toString());
      restaurantModel =
          RestaurantModel.fromJson(json.decode(res.body.toString()));
      setState(() {
        isloading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: restaurantModel.restaurants.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: CachedNetworkImage(
                                    height: 100,
                                    imageUrl:
                                        "https://restaurant-api.dicoding.dev/images/small/" +
                                            restaurantModel
                                                .restaurants[index].pictureId,
                                    placeholder: (context, url) => Image.asset(
                                      'images/food.png',
                                      height: 200,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'images/food.png',
                                      height: 200,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                        restaurantModel.restaurants[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16)),
                                    SizedBox(height: 3),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.pin_drop),
                                        Text(
                                          '${restaurantModel.restaurants[index].city}',
                                          style: TextStyle(fontSize: 14),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          '${restaurantModel.restaurants[index].rating.toString()}',
                                          style: TextStyle(fontSize: 14),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
