import 'package:flutter/material.dart';

import 'package:treva/utilities/contants.dart' as constants;

class MovieBubble extends StatelessWidget {
  final title;
  final year;
  final genre;
  final actors;
  final country;
  final imageURL;
  final runTime;
  final response;
  final error;
  MovieBubble({
    this.title,
    this.year,
    this.genre,
    this.actors,
    this.country,
    this.imageURL,
    this.runTime,
    this.response,
    this.error,
  });

  Widget getPlanetThumbnail() {
    if (imageURL != null) {
      var planetThumbnail = Container(
        alignment: FractionalOffset(0.0, 0.5),
        margin: EdgeInsets.only(left: 24.0),
        child: Image(
          image: NetworkImage(imageURL),
          height: constants.Dimens.planetHeight,
          width: constants.Dimens.planetWidth,
        ),
      );
      return planetThumbnail;
    } else {
      var planetThumbnail = Container(
        alignment: FractionalOffset(0.0, 0.5),
        margin: EdgeInsets.only(left: 24.0),
        child: SizedBox(
          height: constants.Dimens.planetHeight,
          width: constants.Dimens.planetWidth,
        ),
      );
      return planetThumbnail;
    }
  }

  Widget getTitleWidget() {
    if (title != null) {
      return Flexible(
          child: Text(title, style: constants.TextStyles.planetTitle));
    } else {
      return SizedBox(
        height: 24,
      );
    }
  }

  Widget getActorsList() {
    if (actors != null) {
      return Flexible(
          child: Text(actors, style: constants.TextStyles.planetLocation));
    } else {
      return SizedBox(
        height: 14,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final planetCard = Container(
      margin: EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: BoxDecoration(
        color: constants.Colors.planetCard,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 10.0))
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTitleWidget(),
            getActorsList(),
            Container(
                color: Color(0xFF00C6FF),
                width: 24.0,
                height: 1.0,
                margin: EdgeInsets.symmetric(vertical: 8.0)),
            Row(
              children: <Widget>[
                Icon(Icons.access_time,
                    size: 14.0, color: constants.Colors.planetDistance),
                Text(runTime, style: constants.TextStyles.planetDistance),
                Container(width: 24.0),
                Icon(Icons.flight_land,
                    size: 14.0, color: constants.Colors.planetDistance),
                Flexible(
                    child: Text(country,
                        style: constants.TextStyles.planetDistance)),
              ],
            )
          ],
        ),
      ),
    );

    return Container(
      height: 120.0,
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Stack(
        children: <Widget>[
          planetCard,
          getPlanetThumbnail(),
        ],
      ),
    );
  }
}
