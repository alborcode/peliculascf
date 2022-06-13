
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Importamos Modelos
import 'package:peliculascf/models/models.dart';
// Importamos Widgets
import 'package:peliculascf/ui/widgets/widgets.dart';

import 'package:peliculascf/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class ActorCard extends StatelessWidget {
  final Cast actor;
  const ActorCard( this.actor );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage( actor.fullPath ),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox( height: 5 ),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}