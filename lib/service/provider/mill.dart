import 'dart:convert';

import 'package:Inspection/pages/mill/models/mill.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  final url =
      "https://inspection-f215c-default-rtdb.asia-southeast1.firebasedatabase.app/";

  // Get post
  Future<Response> postData(String table, Map<String, Object> object) {
    return post(url + '$table/.json', object);
  }

  // Get request
  Future<Response> getData() {
    get(url + 'mill.json').then((response) {
      List<MillFirebase> _listData = [];
      var dataResponse =
          json.decode(response.bodyString) as Map<String, dynamic>;

      dataResponse.forEach((key, value) {
        _listData.add(MillFirebase(
          userName: value["userName"],
          idUser: value["IDUSER"],
          shift: value["SHIFT"],
          createTime: value['time'],

          // check line 1
          bf07l1: value['BF07_L1'],
          fn07l1: value['FN07_L1'],
          bf08l1: value['BF08_L1'],
          fn08l1: value['FN08_L1'],
          bf09l1: value['BF09_L1'],
          fn09l1: value['FN09_L1'],
          bf10l1: value['BF10_L1'],
          fn10l1: value['FN10_L1'],
          ng01l1: value['NG01_L1'],
          ng02l1: value['NG02_L1'],
          ng03l1: value['NG03_L1'],
          ng04l1: value['NG04_L1'],
          wf01l1: value['WF01_L1'],
          wf02l1: value['WF02_L1'],
          wf03l1: value['WF03_L1'],
          wf04l1: value['WF04_L1'],
          bc01l1: value['BC01_L1'],
          bc02l1: value['BC02_L1'],
          bf02l1: value['BF02_L1'],
          fn02l1: value['FN02_L1'],
          bf03l1: value['BF03_L1'],
          fn03l1: value['FN03_L1'],
          bf04l1: value['BF04_L1'],
          fn04l1: value['FN04_L1'],
          bf05l1: value['BF05_L1'],
          fn05l1: value['FN05_L1'],
          bf06l1: value['BF06_L1'],
          fn06l1: value['FN06_L1'],
          sc01l1: value['SC01_L1'],
          sc02l1: value['SC02_L1'],
          sc03l1: value['SC03_L1'],
          be01l1: value['BE01_L1'],
          bm01l1: value['BM01_L1'],
          lq01l1: value['LQ01_L1'],
          lq02l1: value['LQ02_L1'],
          sr01l1: value['SR01_L1'],
          bf01l1: value['BF01_L1'],
          fn01l1: value['FN01_L1'],
          rf01l1: value['RF01_L1'],
          pp1: value['PP01_L1'],

          // check line 2
          bf07l2: value['BF07_L2'],
          fn07l2: value['FN07_L2'],
          bf08l2: value['BF08_L2'],
          fn08l2: value['FN08_L2'],
          bf09l2: value['BF09_L2'],
          fn09l2: value['FN09_L2'],
          bf10l2: value['BF10_L2'],
          fn10l2: value['FN10_L2'],
          ng01l2: value['NG01_L2'],
          ng02l2: value['NG02_L2'],
          ng03l2: value['NG03_L2'],
          ng04l2: value['NG04_L2'],
          wf01l2: value['WF01_L2'],
          wf02l2: value['WF02_L2'],
          wf03l2: value['WF03_L2'],
          wf04l2: value['WF04_L2'],
          bc01l2: value['BC01_L2'],
          bc02l2: value['BC02_L2'],
          bf02l2: value['BF02_L2'],
          fn02l2: value['FN02_L2'],
          bf03l2: value['BF03_L2'],
          fn03l2: value['FN03_L2'],
          bf04l2: value['BF04_L2'],
          fn04l2: value['FN04_L2'],
          bf05l2: value['BF05_L2'],
          fn05l2: value['FN05_L2'],
          bf06l2: value['BF06_L2'],
          fn06l2: value['FN06_L2'],
          sc01l2: value['SC01_L2'],
          sc02l2: value['SC02_L2'],
          sc03l2: value['SC03_L2'],
          be01l2: value['BE01_L2'],
          bm01l2: value['BM01_L2'],
          lq01l2: value['LQ01_L2'],
          lq02l2: value['LQ02_L2'],
          sr01l2: value['SR01_L2'],
          bf01l2: value['BF01_L2'],
          fn01l2: value['FN01_L2'],
          rf01l2: value['RF01_L2'],
          pp2: value['PP01_L2'],

          // des line 1
          desbf07l1: value['Description_BF07_L1'],
          desfn07l1: value['Description_FN07_L1'],
          desbf08l1: value['Description_BF08_L1'],
          desfn08l1: value['Description_FN08_L1'],
          desbf09l1: value['Description_BF09_L1'],
          desfn09l1: value['Description_FN09_L1'],
          desbf10l1: value['Description_BF10_L1'],
          desfn10l1: value['Description_FN10_L1'],
          desng01l1: value['Description_NG01_L1'],
          desng02l1: value['Description_NG02_L1'],
          desng03l1: value['Description_NG03_L1'],
          desng04l1: value['Description_NG04_L1'],
          deswf01l1: value['Description_WF01_L1'],
          deswf02l1: value['Description_WF02_L1'],
          deswf03l1: value['Description_WF03_L1'],
          deswf04l1: value['Description_WF04_L1'],
          desbc01l1: value['Description_BC01_L1'],
          desbc02l1: value['Description_BC02_L1'],
          desbf02l1: value['Description_BF02_L1'],
          desfn02l1: value['Description_FN02_L1'],
          desbf03l1: value['Description_BF03_L1'],
          desfn03l1: value['Description_FN03_L1'],
          desbf04l1: value['Description_BF04_L1'],
          desfn04l1: value['Description_FN04_L1'],
          desbf05l1: value['Description_BF05_L1'],
          desfn05l1: value['Description_FN05_L1'],
          desbf06l1: value['Description_BF06_L1'],
          desfn06l1: value['Description_FN06_L1'],
          dessc01l1: value['Description_SC01_L1'],
          dessc02l1: value['Description_SC02_L1'],
          dessc03l1: value['Description_SC03_L1'],
          desbe01l1: value['Description_BE01_L1'],
          desbm01l1: value['Description_BM01_L1'],
          deslq01l1: value['Description_LQ01_L1'],
          deslq02l1: value['Description_LQ02_L1'],
          dessr01l1: value['Description_SR01_L1'],
          desbf01l1: value['Description_BF01_L1'],
          desfn01l1: value['Description_FN01_L1'],
          desrf01l1: value['Description_RF01_L1'],
          despp1: value['Description_PP01_L1'],

          // des line 2
          desbf07l2: value['Description_BF07_L2'],
          desfn07l2: value['Description_FN07_L2'],
          desbf08l2: value['Description_BF08_L2'],
          desfn08l2: value['Description_FN08_L2'],
          desbf09l2: value['Description_BF09_L2'],
          desfn09l2: value['Description_FN09_L2'],
          desbf10l2: value['Description_BF10_L2'],
          desfn10l2: value['Description_FN10_L2'],
          desng01l2: value['Description_NG01_L2'],
          desng02l2: value['Description_NG02_L2'],
          desng03l2: value['Description_NG03_L2'],
          desng04l2: value['Description_NG04_L2'],
          deswf01l2: value['Description_WF01_L2'],
          deswf02l2: value['Description_WF02_L2'],
          deswf03l2: value['Description_WF03_L2'],
          deswf04l2: value['Description_WF04_L2'],
          desbc01l2: value['Description_BC01_L2'],
          desbc02l2: value['Description_BC02_L2'],
          desbf02l2: value['Description_BF02_L2'],
          desfn02l2: value['Description_FN02_L2'],
          desbf03l2: value['Description_BF03_L2'],
          desfn03l2: value['Description_FN03_L2'],
          desbf04l2: value['Description_BF04_L2'],
          desfn04l2: value['Description_FN04_L2'],
          desbf05l2: value['Description_BF05_L2'],
          desfn05l2: value['Description_FN05_L2'],
          desbf06l2: value['Description_BF06_L2'],
          desfn06l2: value['Description_FN06_L2'],
          dessc01l2: value['Description_SC01_L2'],
          dessc02l2: value['Description_SC02_L2'],
          dessc03l2: value['Description_SC03_L2'],
          desbe01l2: value['Description_BE01_L2'],
          desbm01l2: value['Description_BM01_L2'],
          deslq01l2: value['Description_LQ01_L2'],
          deslq02l2: value['Description_LQ02_L2'],
          dessr01l2: value['Description_SR01_L2'],
          desbf01l2: value['Description_BF01_L2'],
          desfn01l2: value['Description_FN01_L2'],
          desrf01l2: value['Description_RF01_L2'],
          despp2: value['Description_PP01_L2'],

          // special data
          silo1: value['SILO_1'],
          silo2: value['SILO_2'],
          silo3: value['SILO_3'],
          bf01: value['BF01'],
          bf02: value['BF02'],
          bf03: value['BF03'],
          hg01: value['HG01'],

          // special des
          dessilo1: value['Description_SILO_1'],
          dessilo2: value['Description_SILO_2'],
          dessilo3: value['Description_SILO_3'],
          desbf01: value['Description_BF01'],
          desbf02: value['Description_BF02'],
          desbf03: value['Description_BF03'],
          deshg01: value['Description_HG01'],
        ));
      });
      print("berhasill ${_listData.length}");
      return _listData;
    });
  }
}