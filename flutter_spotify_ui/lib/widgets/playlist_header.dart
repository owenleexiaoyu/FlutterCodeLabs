import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .copyWith(fontSize: 12.0),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Created by ${playlist.creator} - ${playlist.songs.length} songs, ${playlist.duration}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ))
          ],
        ),
        SizedBox(height: 20,),
        _PlaylistButtons(followers: playlist.followers,),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {

  final String followers;

  const _PlaylistButtons({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 48,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Theme.of(context).accentColor,
            primary: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 12, letterSpacing: 2.0),
          ),
          onPressed: () {},
          child: Text("PLAY",),
        ),
        SizedBox(width: 8,),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, size: 30,)),
        SizedBox(width: 8,),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz, size: 30,)),
        Spacer(),
        Text("FOLLOWERS\n$followers", style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        textAlign: TextAlign.right,),
      ],
    );
  }
}
