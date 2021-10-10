import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/models/repo.dart';
import 'package:flutter_github_app/common/funs.dart';

class RepoItem extends StatefulWidget {
  RepoItem(this.repo) : super(key: ValueKey(repo.id));

  final Repo repo;

  @override
  State<StatefulWidget> createState() {
    return _RepoItemState();
  }
}

class _RepoItemState extends State<RepoItem> {
  @override
  Widget build(BuildContext context) {
    var subtitle;
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Material(
          color: Colors.white,
          shape: BorderDirectional(
              bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          )),
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  dense: true,
                  leading: gmAvatar(
                    widget.repo.owner.avatar_url,
                    width: 24,
                    height: 24,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Text(
                    widget.repo.owner.login,
                    textScaleFactor: 0.9,
                  ),
                  subtitle: subtitle,
                  trailing: Text(widget.repo.language ?? ""),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.repo.fork
                            ? widget.repo.full_name
                            : widget.repo.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: widget.repo.fork
                              ? FontStyle.italic
                              : FontStyle.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 12),
                        child: widget.repo.description == null
                            ? Text(
                                "No description",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700],
                                ),
                              )
                            : Text(
                                widget.repo.description,
                                maxLines: 3,
                                style: TextStyle(
                                    height: 1.5,
                                    color: Colors.blueGrey[700],
                                    fontSize: 13),
                              ),
                      )
                    ],
                  ),
                ),
                _buildBottom()
              ],
            ),
          )),
    );
  }

  Widget _buildBottom() {
    const paddingWidth = 10;
    return IconTheme(
        data: IconThemeData(color: Colors.grey, size: 15),
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.grey, fontSize: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Builder(
              builder: (context) {
                var children = <Widget>[
                  Icon(Icons.star),
                  Text(" " +
                      widget.repo.stargazers_count
                          .toString()
                          .padRight(paddingWidth)),
                  Icon(Icons.info_outline),
                  Text(" " +
                      widget.repo.open_issues_count
                          .toString()
                          .padRight(paddingWidth)),
                  Icon(Icons.description),
                  Text(" " +
                      widget.repo.forks_count
                          .toString()
                          .padRight(paddingWidth)),
                ];
                if (widget.repo.fork) {
                  children.add(Text("Forked".padRight(paddingWidth)));
                }
                if (widget.repo.private == true) {
                  children.addAll(<Widget>[
                    Icon(Icons.lock),
                    Text(" private".padRight(paddingWidth)),
                  ]);
                }
                return Row(
                  children: children,
                );
              },
            ),
          ),
        ));
  }
}
