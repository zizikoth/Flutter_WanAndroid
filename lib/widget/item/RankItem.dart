import 'package:flutter/material.dart';
import 'package:wan/entity/remote/RankResponse.dart';
import 'package:wan/res/Res.dart';
import 'package:wan/tools/Tools.dart';

class RankItem extends StatefulWidget {
  final RankItemInfo info;

  RankItem(this.info);

  @override
  State<StatefulWidget> createState() => _RankItem();
}

class _RankItem extends State<RankItem> {
  @override
  Widget build(BuildContext context) {
    var info = widget.info;

    return Column(
      children: [
        Container(
          color: ResColors.White,
          width: double.infinity,
          height: ResDimen.barHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRankIcon(info),
              Expanded(
                  child: Text(
                info.username.orEmpty,
                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
              )),
              Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Text("${info.coinCount}", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal)))
            ],
          ),
        ),
        Container(width: double.infinity, height: ResDimen.line, color: ResColors.Line)
      ],
    );
  }

  Widget _buildRankIcon(RankItemInfo info) {
    var child;
    if (info.rank == '1') {
      child = Image.asset(ResAssets.ic_first, width: ResDimen.w25, height: ResDimen.w25);
    } else if (info.rank == '2') {
      child = Image.asset(ResAssets.ic_second, width: ResDimen.w25, height: ResDimen.w25);
    } else if (info.rank == '3') {
      child = Image.asset(ResAssets.ic_third, width: ResDimen.w25, height: ResDimen.w25);
    } else {
      child = Text(
        info.rank.orEmpty,
        style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
      );
    }
    return Container(
      width: ResDimen.barHeight,
      height: ResDimen.barHeight,
      alignment: Alignment.center,
      child: child,
    );
  }
}
