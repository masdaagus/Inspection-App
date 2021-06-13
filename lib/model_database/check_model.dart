import 'package:flutter/cupertino.dart';

final String tableCheck = 'TableCheck';
final String tableMerge = 'TableMerge';

class MillFields {
  static final List<String> values = [
    id,
    time,
    line,
    bf07,
    fn07,
    bf08,
    fn08,
    bf09,
    fn09,
    bf10,
    fn10,
    ng01,
    ng02,
    ng03,
    ng04,
    wf01,
    wf02,
    wf03,
    wf04,
    bc01,
    bc02,
    bf02,
    fn02,
    bf03,
    fn03,
    bf04,
    fn04,
    bf05,
    fn05,
    bf06,
    fn06,
    sc01,
    sc02,
    sc03,
    be01,
    bm01,
    lq01,
    lq02,
    sr01,
    bf01,
    fn01,
    rf01,
    description_bf07,
    description_fn07,
    description_bf08,
    description_fn08,
    description_bf09,
    description_fn09,
    description_bf10,
    description_fn10,
    description_ng01,
    description_ng02,
    description_ng03,
    description_ng04,
    description_wf01,
    description_wf02,
    description_wf03,
    description_wf04,
    description_bc01,
    description_bc02,
    description_bf02,
    description_fn02,
    description_bf03,
    description_fn03,
    description_bf04,
    description_fn04,
    description_bf05,
    description_fn05,
    description_bf06,
    description_fn06,
    description_sc01,
    description_sc02,
    description_sc03,
    description_be01,
    description_bm01,
    description_lq01,
    description_lq02,
    description_sr01,
    description_bf01,
    description_fn01,
    description_rf01,
  ];

  static final String id = '_id';
  static final String line = 'line';
  static final String time = 'time';

  static final String bf07 = 'BF07';
  static final String fn07 = 'FN07';
  static final String bf08 = 'BF08';
  static final String fn08 = 'FN08';
  static final String bf09 = 'BF09';
  static final String fn09 = 'FN09';
  static final String bf10 = 'BF10';
  static final String fn10 = 'FN10';
  static final String ng01 = 'NG01';
  static final String ng02 = 'NG02';
  static final String ng03 = 'NG03';
  static final String ng04 = 'NG04';
  static final String wf01 = 'WF01';
  static final String wf02 = 'WF02';
  static final String wf03 = 'WF03';
  static final String wf04 = 'WF04';
  static final String bc01 = 'BC01';
  static final String bc02 = 'BC02';
  static final String bf02 = 'BF02';
  static final String fn02 = 'FN02';
  static final String bf03 = 'BF03';
  static final String fn03 = 'FN03';
  static final String bf04 = 'BF04';
  static final String fn04 = 'FN04';
  static final String bf05 = 'BF05';
  static final String fn05 = 'FN05';
  static final String bf06 = 'BF06';
  static final String fn06 = 'FN06';
  static final String sc01 = 'SC01';
  static final String sc02 = 'SC02';
  static final String sc03 = 'SC03';
  static final String be01 = 'BE01';
  static final String bm01 = 'BM01';
  static final String lq01 = 'LQ01';
  static final String lq02 = 'LQ02';
  static final String sr01 = 'SR01';
  static final String bf01 = 'BF01';
  static final String fn01 = 'FN01';
  static final String rf01 = 'RF01';

  static final String description_bf07 = 'Description_BF07';
  static final String description_fn07 = 'Description_FN07';
  static final String description_bf08 = 'Description_BF08';
  static final String description_fn08 = 'Description_FN08';
  static final String description_bf09 = 'Description_BF09';
  static final String description_fn09 = 'Description_FN09';
  static final String description_bf10 = 'Description_BF10';
  static final String description_fn10 = 'Description_FN10';
  static final String description_ng01 = 'Description_NG01';
  static final String description_ng02 = 'Description_NG02';
  static final String description_ng03 = 'Description_NG03';
  static final String description_ng04 = 'Description_NG04';
  static final String description_wf01 = 'Description_WF01';
  static final String description_wf02 = 'Description_WF02';
  static final String description_wf03 = 'Description_WF03';
  static final String description_wf04 = 'Description_WF04';
  static final String description_bc01 = 'Description_BC01';
  static final String description_bc02 = 'Description_BC02';
  static final String description_bf02 = 'Description_BF02';
  static final String description_fn02 = 'Description_FN02';
  static final String description_bf03 = 'Description_BF03';
  static final String description_fn03 = 'Description_FN03';
  static final String description_bf04 = 'Description_BF04';
  static final String description_fn04 = 'Description_FN04';
  static final String description_bf05 = 'Description_BF05';
  static final String description_fn05 = 'Description_FN05';
  static final String description_bf06 = 'Description_BF06';
  static final String description_fn06 = 'Description_FN06';
  static final String description_sc01 = 'Description_SC01';
  static final String description_sc02 = 'Description_SC02';
  static final String description_sc03 = 'Description_SC03';
  static final String description_be01 = 'Description_BE01';
  static final String description_bm01 = 'Description_BM01';
  static final String description_lq01 = 'Description_LQ01';
  static final String description_lq02 = 'Description_LQ02';
  static final String description_sr01 = 'Description_SR01';
  static final String description_bf01 = 'Description_BF01';
  static final String description_fn01 = 'Description_FN01';
  static final String description_rf01 = 'Description_RF01';
}

class Check {
  final int id;
  final int line;
  final DateTime createTime;

  final bool bf07;
  final bool fn07;
  final bool bf08;
  final bool fn08;
  final bool bf09;
  final bool fn09;
  final bool bf10;
  final bool fn10;
  final bool ng01;
  final bool ng02;
  final bool ng03;
  final bool ng04;
  final bool wf01;
  final bool wf02;
  final bool wf03;
  final bool wf04;
  final bool bc01;
  final bool bc02;
  final bool bf02;
  final bool fn02;
  final bool bf03;
  final bool fn03;
  final bool bf04;
  final bool fn04;
  final bool bf05;
  final bool fn05;
  final bool bf06;
  final bool fn06;
  final bool sc01;
  final bool sc02;
  final bool sc03;
  final bool be01;
  final bool bm01;
  final bool lq01;
  final bool lq02;
  final bool sr01;
  final bool bf01;
  final bool fn01;
  final bool rf01;

  final String description_bf07;
  final String description_fn07;
  final String description_bf08;
  final String description_fn08;
  final String description_bf09;
  final String description_fn09;
  final String description_bf10;
  final String description_fn10;
  final String description_ng01;
  final String description_ng02;
  final String description_ng03;
  final String description_ng04;
  final String description_wf01;
  final String description_wf02;
  final String description_wf03;
  final String description_wf04;
  final String description_bc01;
  final String description_bc02;
  final String description_bf02;
  final String description_fn02;
  final String description_bf03;
  final String description_fn03;
  final String description_bf04;
  final String description_fn04;
  final String description_bf05;
  final String description_fn05;
  final String description_bf06;
  final String description_fn06;
  final String description_sc01;
  final String description_sc02;
  final String description_sc03;
  final String description_be01;
  final String description_bm01;
  final String description_lq01;
  final String description_lq02;
  final String description_sr01;
  final String description_bf01;
  final String description_fn01;
  final String description_rf01;

  const Check({
    this.id,
    @required this.line,
    @required this.createTime,
    @required this.bf07,
    @required this.fn07,
    @required this.bf08,
    @required this.fn08,
    @required this.bf09,
    @required this.fn09,
    @required this.bf10,
    @required this.fn10,
    @required this.ng01,
    @required this.ng02,
    @required this.ng03,
    @required this.ng04,
    @required this.wf01,
    @required this.wf02,
    @required this.wf03,
    @required this.wf04,
    @required this.bc01,
    @required this.bc02,
    @required this.bf02,
    @required this.fn02,
    @required this.bf03,
    @required this.fn03,
    @required this.bf04,
    @required this.fn04,
    @required this.bf05,
    @required this.fn05,
    @required this.bf06,
    @required this.fn06,
    @required this.sc01,
    @required this.sc02,
    @required this.sc03,
    @required this.be01,
    @required this.bm01,
    @required this.lq01,
    @required this.lq02,
    @required this.sr01,
    @required this.bf01,
    @required this.fn01,
    @required this.rf01,
    @required this.description_bf07,
    @required this.description_fn07,
    @required this.description_bf08,
    @required this.description_fn08,
    @required this.description_bf09,
    @required this.description_fn09,
    @required this.description_bf10,
    @required this.description_fn10,
    @required this.description_ng01,
    @required this.description_ng02,
    @required this.description_ng03,
    @required this.description_ng04,
    @required this.description_wf01,
    @required this.description_wf02,
    @required this.description_wf03,
    @required this.description_wf04,
    @required this.description_bc01,
    @required this.description_bc02,
    @required this.description_bf02,
    @required this.description_fn02,
    @required this.description_bf03,
    @required this.description_fn03,
    @required this.description_bf04,
    @required this.description_fn04,
    @required this.description_bf05,
    @required this.description_fn05,
    @required this.description_bf06,
    @required this.description_fn06,
    @required this.description_sc01,
    @required this.description_sc02,
    @required this.description_sc03,
    @required this.description_be01,
    @required this.description_bm01,
    @required this.description_lq01,
    @required this.description_lq02,
    @required this.description_sr01,
    @required this.description_bf01,
    @required this.description_fn01,
    @required this.description_rf01,
  });

  static Check fromJson(Map<String, Object> json) => Check(
        id: json[MillFields.id] as int,
        line: json[MillFields.line] as int,
        createTime: DateTime.parse(json[MillFields.time] as String),
        bf07: json[MillFields.bf07] == 1,
        fn07: json[MillFields.fn07] == 1,
        bf08: json[MillFields.bf08] == 1,
        fn08: json[MillFields.fn08] == 1,
        bf09: json[MillFields.bf09] == 1,
        fn09: json[MillFields.fn09] == 1,
        bf10: json[MillFields.bf10] == 1,
        fn10: json[MillFields.fn10] == 1,
        ng01: json[MillFields.ng01] == 1,
        ng02: json[MillFields.ng02] == 1,
        ng03: json[MillFields.ng03] == 1,
        ng04: json[MillFields.ng04] == 1,
        wf01: json[MillFields.wf01] == 1,
        wf02: json[MillFields.wf02] == 1,
        wf03: json[MillFields.wf03] == 1,
        wf04: json[MillFields.wf04] == 1,
        bc01: json[MillFields.bc01] == 1,
        bc02: json[MillFields.bc02] == 1,
        bf02: json[MillFields.bf02] == 1,
        fn02: json[MillFields.fn02] == 1,
        bf03: json[MillFields.bf03] == 1,
        fn03: json[MillFields.fn03] == 1,
        bf04: json[MillFields.bf04] == 1,
        fn04: json[MillFields.fn04] == 1,
        bf05: json[MillFields.bf05] == 1,
        fn05: json[MillFields.fn05] == 1,
        bf06: json[MillFields.bf06] == 1,
        fn06: json[MillFields.fn06] == 1,
        sc01: json[MillFields.sc01] == 1,
        sc02: json[MillFields.sc02] == 1,
        sc03: json[MillFields.sc03] == 1,
        be01: json[MillFields.be01] == 1,
        bm01: json[MillFields.bm01] == 1,
        lq01: json[MillFields.lq01] == 1,
        lq02: json[MillFields.lq02] == 1,
        sr01: json[MillFields.sr01] == 1,
        bf01: json[MillFields.bf01] == 1,
        fn01: json[MillFields.fn01] == 1,
        rf01: json[MillFields.rf01] == 1,
        description_bf07: json[MillFields.description_bf07] as String,
        description_fn07: json[MillFields.description_fn07] as String,
        description_bf08: json[MillFields.description_bf08] as String,
        description_fn08: json[MillFields.description_fn08] as String,
        description_bf09: json[MillFields.description_bf09] as String,
        description_fn09: json[MillFields.description_fn09] as String,
        description_bf10: json[MillFields.description_bf10] as String,
        description_fn10: json[MillFields.description_fn10] as String,
        description_ng01: json[MillFields.description_ng01] as String,
        description_ng02: json[MillFields.description_ng02] as String,
        description_ng03: json[MillFields.description_ng03] as String,
        description_ng04: json[MillFields.description_ng04] as String,
        description_wf01: json[MillFields.description_wf01] as String,
        description_wf02: json[MillFields.description_wf02] as String,
        description_wf03: json[MillFields.description_wf03] as String,
        description_wf04: json[MillFields.description_wf04] as String,
        description_bc01: json[MillFields.description_bc01] as String,
        description_bc02: json[MillFields.description_bc02] as String,
        description_bf02: json[MillFields.description_bf02] as String,
        description_fn02: json[MillFields.description_fn02] as String,
        description_bf03: json[MillFields.description_bf03] as String,
        description_fn03: json[MillFields.description_fn03] as String,
        description_bf04: json[MillFields.description_bf04] as String,
        description_fn04: json[MillFields.description_fn04] as String,
        description_bf05: json[MillFields.description_bf05] as String,
        description_fn05: json[MillFields.description_fn05] as String,
        description_bf06: json[MillFields.description_bf06] as String,
        description_fn06: json[MillFields.description_fn06] as String,
        description_sc01: json[MillFields.description_sc01] as String,
        description_sc02: json[MillFields.description_sc02] as String,
        description_sc03: json[MillFields.description_sc03] as String,
        description_be01: json[MillFields.description_be01] as String,
        description_bm01: json[MillFields.description_bm01] as String,
        description_lq01: json[MillFields.description_lq01] as String,
        description_lq02: json[MillFields.description_lq02] as String,
        description_sr01: json[MillFields.description_sr01] as String,
        description_bf01: json[MillFields.description_bf01] as String,
        description_fn01: json[MillFields.description_fn01] as String,
        description_rf01: json[MillFields.description_rf01] as String,
      );

  Map<String, Object> toJson() => {
        MillFields.id: id,
        MillFields.line: line,
        MillFields.time: createTime.toIso8601String(),
        MillFields.bf07: bf07 ? 1 : 0,
        MillFields.fn07: fn07 ? 1 : 0,
        MillFields.bf08: bf08 ? 1 : 0,
        MillFields.fn08: fn08 ? 1 : 0,
        MillFields.bf09: bf09 ? 1 : 0,
        MillFields.fn09: fn09 ? 1 : 0,
        MillFields.bf10: bf10 ? 1 : 0,
        MillFields.fn10: fn10 ? 1 : 0,
        MillFields.ng01: ng01 ? 1 : 0,
        MillFields.ng02: ng02 ? 1 : 0,
        MillFields.ng03: ng03 ? 1 : 0,
        MillFields.ng04: ng04 ? 1 : 0,
        MillFields.wf01: wf01 ? 1 : 0,
        MillFields.wf02: wf02 ? 1 : 0,
        MillFields.wf03: wf03 ? 1 : 0,
        MillFields.wf04: wf04 ? 1 : 0,
        MillFields.bc01: bc01 ? 1 : 0,
        MillFields.bc02: bc02 ? 1 : 0,
        MillFields.bf02: bf02 ? 1 : 0,
        MillFields.fn02: fn02 ? 1 : 0,
        MillFields.bf03: bf03 ? 1 : 0,
        MillFields.fn03: fn03 ? 1 : 0,
        MillFields.bf04: bf04 ? 1 : 0,
        MillFields.fn04: fn04 ? 1 : 0,
        MillFields.bf05: bf05 ? 1 : 0,
        MillFields.fn05: fn05 ? 1 : 0,
        MillFields.bf06: bf06 ? 1 : 0,
        MillFields.fn06: fn06 ? 1 : 0,
        MillFields.sc01: sc01 ? 1 : 0,
        MillFields.sc02: sc02 ? 1 : 0,
        MillFields.sc03: sc03 ? 1 : 0,
        MillFields.be01: be01 ? 1 : 0,
        MillFields.bm01: bm01 ? 1 : 0,
        MillFields.lq01: lq01 ? 1 : 0,
        MillFields.lq02: lq02 ? 1 : 0,
        MillFields.sr01: sr01 ? 1 : 0,
        MillFields.bf01: bf01 ? 1 : 0,
        MillFields.fn01: fn01 ? 1 : 0,
        MillFields.rf01: rf01 ? 1 : 0,
        MillFields.description_bf07: description_bf07,
        MillFields.description_fn07: description_fn07,
        MillFields.description_bf08: description_bf08,
        MillFields.description_fn08: description_fn08,
        MillFields.description_bf09: description_bf09,
        MillFields.description_fn09: description_fn09,
        MillFields.description_bf10: description_bf10,
        MillFields.description_fn10: description_fn10,
        MillFields.description_ng01: description_ng01,
        MillFields.description_ng02: description_ng02,
        MillFields.description_ng03: description_ng03,
        MillFields.description_ng04: description_ng04,
        MillFields.description_wf01: description_wf01,
        MillFields.description_wf02: description_wf02,
        MillFields.description_wf03: description_wf03,
        MillFields.description_wf04: description_wf04,
        MillFields.description_bc01: description_bc01,
        MillFields.description_bc02: description_bc02,
        MillFields.description_bf02: description_bf02,
        MillFields.description_fn02: description_fn02,
        MillFields.description_bf03: description_bf03,
        MillFields.description_fn03: description_fn03,
        MillFields.description_bf04: description_bf04,
        MillFields.description_fn04: description_fn04,
        MillFields.description_bf05: description_bf05,
        MillFields.description_fn05: description_fn05,
        MillFields.description_bf06: description_bf06,
        MillFields.description_fn06: description_fn06,
        MillFields.description_sc01: description_sc01,
        MillFields.description_sc02: description_sc02,
        MillFields.description_sc03: description_sc03,
        MillFields.description_be01: description_be01,
        MillFields.description_bm01: description_bm01,
        MillFields.description_lq01: description_lq01,
        MillFields.description_lq02: description_lq02,
        MillFields.description_sr01: description_sr01,
        MillFields.description_bf01: description_bf01,
        MillFields.description_fn01: description_fn01,
        MillFields.description_rf01: description_rf01,
      };
}
