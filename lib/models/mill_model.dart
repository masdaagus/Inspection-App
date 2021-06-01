import 'package:flutter/cupertino.dart';

final String tableCheck = 'TableCheck';

class IsiMill {
  static final List<String> values = [
    id,
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
    rf01
  ];

  static final String id = '_id';
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
}

class Mill {
  final int id;

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

  const Mill({
    this.id,
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
  });

  Mill copy(
          {int id,
          bool bf07,
          bool fn07,
          bool bf08,
          bool fn08,
          bool bf09,
          bool fn09,
          bool bf10,
          bool fn10,
          bool ng01,
          bool ng02,
          bool ng03,
          bool ng04,
          bool wf01,
          bool wf02,
          bool wf03,
          bool wf04,
          bool bc01,
          bool bc02,
          bool bf02,
          bool fn02,
          bool bf03,
          bool fn03,
          bool bf04,
          bool fn04,
          bool bf05,
          bool fn05,
          bool bf06,
          bool fn06,
          bool sc01,
          bool sc02,
          bool sc03,
          bool be01,
          bool bm01,
          bool lq01,
          bool lq02,
          bool sr01,
          bool bf01,
          bool fn01,
          bool rf01}) =>
      Mill(
        id: id ?? this.id,
        bf07: bf07 ?? this.bf07,
        fn07: fn07 ?? this.fn07,
        bf08: bf08 ?? this.bf08,
        fn08: fn08 ?? this.fn08,
        bf09: bf09 ?? this.bf09,
        fn09: fn09 ?? this.fn09,
        bf10: bf10 ?? this.bf10,
        fn10: fn10 ?? this.fn10,
        ng01: ng01 ?? this.ng01,
        ng02: ng02 ?? this.ng02,
        ng03: ng03 ?? this.ng03,
        ng04: ng04 ?? this.ng04,
        wf01: wf01 ?? this.wf01,
        wf02: wf02 ?? this.wf02,
        wf03: wf03 ?? this.wf03,
        wf04: wf04 ?? this.wf04,
        bc01: bc01 ?? this.bc01,
        bc02: bc02 ?? this.bc02,
        bf02: bf02 ?? this.bf02,
        fn02: fn02 ?? this.fn02,
        bf03: bf03 ?? this.bf03,
        fn03: fn03 ?? this.fn03,
        bf04: bf04 ?? this.bf04,
        fn04: fn04 ?? this.fn04,
        bf05: bf05 ?? this.bf05,
        fn05: fn05 ?? this.fn05,
        bf06: bf06 ?? this.bf06,
        fn06: fn06 ?? this.fn06,
        sc01: sc01 ?? this.sc01,
        sc02: sc02 ?? this.sc02,
        sc03: sc03 ?? this.sc03,
        be01: be01 ?? this.be01,
        bm01: bm01 ?? this.bm01,
        lq01: lq01 ?? this.lq01,
        lq02: lq02 ?? this.lq02,
        sr01: sr01 ?? this.sr01,
        bf01: bf01 ?? this.bf01,
        fn01: fn01 ?? this.fn01,
        rf01: rf01 ?? this.rf01,
      );

  static Mill fromJson(Map<String, Object> json) => Mill(
        id: json[IsiMill.id] as int,
        bf07: json[IsiMill.bf07] == 1,
        fn07: json[IsiMill.fn07] == 1,
        bf08: json[IsiMill.bf08] == 1,
        fn08: json[IsiMill.fn08] == 1,
        bf09: json[IsiMill.bf09] == 1,
        fn09: json[IsiMill.fn09] == 1,
        bf10: json[IsiMill.bf10] == 1,
        fn10: json[IsiMill.fn10] == 1,
        ng01: json[IsiMill.ng01] == 1,
        ng02: json[IsiMill.ng02] == 1,
        ng03: json[IsiMill.ng03] == 1,
        ng04: json[IsiMill.ng04] == 1,
        wf01: json[IsiMill.wf01] == 1,
        wf02: json[IsiMill.wf02] == 1,
        wf03: json[IsiMill.wf03] == 1,
        wf04: json[IsiMill.wf04] == 1,
        bc01: json[IsiMill.bc01] == 1,
        bc02: json[IsiMill.bc02] == 1,
        bf02: json[IsiMill.bf02] == 1,
        fn02: json[IsiMill.fn02] == 1,
        bf03: json[IsiMill.bf03] == 1,
        fn03: json[IsiMill.fn03] == 1,
        bf04: json[IsiMill.bf04] == 1,
        fn04: json[IsiMill.fn04] == 1,
        bf05: json[IsiMill.bf05] == 1,
        fn05: json[IsiMill.fn05] == 1,
        bf06: json[IsiMill.bf06] == 1,
        fn06: json[IsiMill.fn06] == 1,
        sc01: json[IsiMill.sc01] == 1,
        sc02: json[IsiMill.sc02] == 1,
        sc03: json[IsiMill.sc03] == 1,
        be01: json[IsiMill.be01] == 1,
        bm01: json[IsiMill.bm01] == 1,
        lq01: json[IsiMill.lq01] == 1,
        lq02: json[IsiMill.lq02] == 1,
        sr01: json[IsiMill.sr01] == 1,
        bf01: json[IsiMill.bf01] == 1,
        fn01: json[IsiMill.fn01] == 1,
        rf01: json[IsiMill.rf01] == 1,
      );

  Map<String, Object> toJson() => {
        IsiMill.id: id,
        IsiMill.bf07: bf07 ? 1 : 0,
        IsiMill.fn07: fn07 ? 1 : 0,
        IsiMill.bf08: bf08 ? 1 : 0,
        IsiMill.fn08: fn08 ? 1 : 0,
        IsiMill.bf09: bf09 ? 1 : 0,
        IsiMill.fn09: fn09 ? 1 : 0,
        IsiMill.bf10: bf10 ? 1 : 0,
        IsiMill.fn10: fn10 ? 1 : 0,
        IsiMill.ng01: ng01 ? 1 : 0,
        IsiMill.ng02: ng02 ? 1 : 0,
        IsiMill.ng03: ng03 ? 1 : 0,
        IsiMill.ng04: ng04 ? 1 : 0,
        IsiMill.wf01: wf01 ? 1 : 0,
        IsiMill.wf02: wf02 ? 1 : 0,
        IsiMill.wf03: wf03 ? 1 : 0,
        IsiMill.wf04: wf04 ? 1 : 0,
        IsiMill.bc01: bc01 ? 1 : 0,
        IsiMill.bc02: bc02 ? 1 : 0,
        IsiMill.bf02: bf02 ? 1 : 0,
        IsiMill.fn02: fn02 ? 1 : 0,
        IsiMill.bf03: bf03 ? 1 : 0,
        IsiMill.fn03: fn03 ? 1 : 0,
        IsiMill.bf04: bf04 ? 1 : 0,
        IsiMill.fn04: fn04 ? 1 : 0,
        IsiMill.bf05: bf05 ? 1 : 0,
        IsiMill.fn05: fn05 ? 1 : 0,
        IsiMill.bf06: bf06 ? 1 : 0,
        IsiMill.fn06: fn06 ? 1 : 0,
        IsiMill.sc01: sc01 ? 1 : 0,
        IsiMill.sc02: sc02 ? 1 : 0,
        IsiMill.sc03: sc03 ? 1 : 0,
        IsiMill.be01: be01 ? 1 : 0,
        IsiMill.bm01: bm01 ? 1 : 0,
        IsiMill.lq01: lq01 ? 1 : 0,
        IsiMill.lq02: lq02 ? 1 : 0,
        IsiMill.sr01: sr01 ? 1 : 0,
        IsiMill.bf01: bf01 ? 1 : 0,
        IsiMill.fn01: fn01 ? 1 : 0,
        IsiMill.rf01: rf01 ? 1 : 0,
      };
}
