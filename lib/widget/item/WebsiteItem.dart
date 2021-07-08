import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wan/entity/remote/WebsiteResponse.dart';
import 'package:wan/tools/Tools.dart';

class WebsiteItem extends StatefulWidget {
  final Website website;

  final SlidableController slidableController;

  final Function(Website) onEdit;

  final Function(Website) onDelete;

  WebsiteItem(this.website, this.slidableController, this.onEdit, this.onDelete);

  @override
  State<StatefulWidget> createState() => _WebsiteItem();
}

class _WebsiteItem extends State<WebsiteItem> {
  @override
  Widget build(BuildContext context) {
    var website = widget.website;
    return Slidable(
      controller: widget.slidableController,
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15.w, 7.5.w, 15.w, 7.5.w),
        child: InkWell(
          onTap: () {
            RouteManager.startWeb(website.name.orEmpty, website.link.orEmpty);
          },
          child: Card(
            elevation: ResDimen.w10,
            child: Container(
              padding: EdgeInsets.all(ResDimen.w10),
              child: Column(
                children: [
                  Text(
                    website.name.orEmpty,
                    style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: ResDimen.w15),
                      child: Text(
                        website.link.orEmpty,
                        style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      secondaryActions: [
        Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              width: 70.w,
              height: 70.w,
              child: IconSlideAction(
                caption: '修改',
                icon: Icons.edit,
                foregroundColor: ResColors.White,
                color: ResColors.TodoEdit,
                onTap: () {
                  Slidable.of(context)?.close();
                  widget.onEdit(website);
                },
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              width: 70.w,
              height: 70.w,
              child: IconSlideAction(
                caption: '删除',
                icon: Icons.delete_forever,
                foregroundColor: ResColors.White,
                color: ResColors.TodoDelete,
                onTap: () {
                  Slidable.of(context)?.close();
                  widget.onDelete(website);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
