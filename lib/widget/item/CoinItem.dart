import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan/entity/remote/CoinListResponse.dart';
import 'package:wan/tools/Tools.dart';

class CoinItem extends StatefulWidget {
  final CoinItemInfo coinInfo;

  CoinItem(this.coinInfo);

  @override
  State<StatefulWidget> createState() => _CoinItem();
}

class _CoinItem extends State<CoinItem> {
  @override
  Widget build(BuildContext context) {
    var info = widget.coinInfo;
    return Container(
        color: ResColors.White,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(ResDimen.w15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info.userName.orEmpty,
                          style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                        ),
                        Container(height: ResDimen.w10),
                        Text(
                          info.reason.orEmpty,
                          style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                        ),
                        Container(height: ResDimen.w10),
                        Text(
                          info.desc.orEmpty,
                          style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+${info.coinCount}",
                    style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark),
                  )
                ],
              ),
            ),
            Container(
              color: ResColors.Line,
              height: ResDimen.w5,
            )
          ],
        ));
  }
}
