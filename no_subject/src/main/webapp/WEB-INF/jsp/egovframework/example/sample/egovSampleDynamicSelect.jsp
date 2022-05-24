<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
</head>

<body>
<div id="targetDiv">타겟</div>
	<script type="text/javaScript" language="javascript" defer="defer">
	    	
var unitData = [ {
	"idx" : 0,
	"std" : "위치",
	"note" : [ "사용자의 위치를 선택한다." ],
	"type" : "sel_dynamic",
	"ref_sel_dynamic" : [ {
		"nm" : "서울특별시",
		"idx" : "10000",
		"option" : [ {
			"nm" : "강남구",
			"idx" : "10001",
			"option" : [ {
				"nm" : "개포동",
				"idx" : "10002",
				"val" : 70
			}, {
				"nm" : "논현동",
				"idx" : "10003",
				"val" : 70
			}, {
				"nm" : "대치동",
				"idx" : "10004",
				"val" : 70
			}, ]
		}, {
			"nm" : "강동구",
			"idx" : "10007",
			"option" : [ {
				"nm" : "강일동",
				"idx" : "10009",
				"val" : 50
			}, {
				"nm" : "고덕동",
				"idx" : "10010",
				"val" : 40
			}, {
				"nm" : "구일동",
				"idx" : "10011",
				"val" : 30
			}, {
				"nm" : "둔촌동",
				"idx" : "10012",
				"val" : 20
			} ]
		}, {
			"nm" : "강북구",
			"idx" : "10013",
			"option" : [ {
				"nm" : "미아동",
				"idx" : "10015",
				"val" : 0
			} ]
		} ]
	}, {
		"nm" : "대구광역시",
		"idx" : "20000",
		"option" : [ {
			"nm" : "남구",
			"idx" : "20001",
			"option" : [ {
				"nm" : "대명동",
				"idx" : "20003",
				"val" : 70
			}, {
				"nm" : "복덕동",
				"idx" : "20004",
				"val" : 60
			}, {
				"nm" : "이천동",
				"idx" : "20005",
				"val" : 50
			} ]
		}, {
			"nm" : "달서구",
			"idx" : "20006",
			"option" : [ {
				"nm" : "갈산동",
				"idx" : "20008",
				"val" : 60
			}, {
				"nm" : "감삼동",
				"idx" : "20009",
				"val" : 50
			}, {
				"nm" : "대곡동",
				"idx" : "20010",
				"val" : 40
			}, {
				"nm" : "대천동",
				"idx" : "20011",
				"val" : 30
			}, {
				"nm" : "도원동",
				"idx" : "20011",
				"val" : 70
			}, {
				"nm" : "두류동",
				"idx" : "20011",
				"val" : 80
			} ]
		}, {
			"nm" : "달성군",
			"idx" : "20012",
			"option" : [ {
				"nm" : "가창면",
				"idx" : "20014",
				"val" : 30
			}, {
				"nm" : "구지면",
				"idx" : "20015",
				"val" : 20
			}, {
				"nm" : "논공읍",
				"idx" : "20016",
				"val" : 10
			} ]
		}, {
			"nm" : "동구",
			"idx" : "20017",
			"option" : [ {
				"nm" : "각산동",
				"idx" : "20019",
				"val" : 0
			} ]
		} ]
	}, {
		"nm" : "인천광역시",
		"idx" : "30000",
		"option" : [ {
			"nm" : "강화군",
			"idx" : "30001",
			"option" : [ {
				"nm" : "강화읍",
				"idx" : "30003",
				"val" : 0
			} ]
		} ]
	} ],
	"std_group_sel_dynamic" : [ "시", "군", "구" ]
} ];

unitData = unitData[0];
		
if(unitData.type == "sel_dynamic"){//동적 select박스 최초 생성하는 함수
	var _html = '' //화면에 output할 html 문자열을 저장할 곳
	var _str = '}'; //자르기를 마칠 문자열
	var _pointStr = ""; //자르기를 시작할 문자열 중에서 구분 문자열
	var _dataStrAfterObj; //DB의 트리데이터 문자열을 가공 후 Object로 저장할 곳

	var _refSelDynamic = unitData.ref_sel_dynamic; //DB 데이터 ref_sel_dynamic키에 담긴 값 저장
	var _refSelDynamicStr = JSON
			.stringify(unitData.ref_sel_dynamic) //DB 데이터에서 ref_sel_dynamic키에 담긴 값을 문자열로 저장함(프론트에서 가공할거임)
	var _stdGroupSelDynamic = unitData.std_group_sel_dynamic; //DB 데이터 std_group_sel_dynamic키에 담긴 값 저장

	for (var j = 0; j < _stdGroupSelDynamic.length - 1; j++) { //'}'(object 닫기 표시)로 초기화 되어있는 자를 문자열을 std_group_sel_dynamic의 갯수만큼 ']}'(배열 닫기 표시 + object 닫기 표시)를 늘려줌.
		_str += ']}';
	}

	for (var j = 0; j < _stdGroupSelDynamic.length; j++) {
		_html += '	<select nm="'
				+ unitData.std_group_sel_dynamic[j]
				+ '" unit="" name="dymSlct_'
				+ j
				+ '" id="dymSlct_'
				+ j
				+ '" onchange="changeDymSlctRvsn($(this),'
				+ j
				+ ')" style="height: 35px; width: 200px; border-radius: 5px; border: 1px solid #B4B4B4; background-color: #fff; text-indent: 8px; margin-left: 2px; margin-bottom: 6px;">';//select 만들기 시작
		if (j < 1) {//최상단 select를 따로 만듬.
			_pointStr = _refSelDynamic[0].nm + '","idx":"'
					+ _refSelDynamic[0].idx + '"';
			for (var k = 0; k < _refSelDynamic.length; k++) {
				_html += "<option idx='"+_refSelDynamic[k].idx+"'>"
						+ _refSelDynamic[k].nm + "</option>";
			}
		} else {//최상단 select를 제외한 나머지 자식 select를 만듬.
			var before = _refSelDynamicStr.indexOf(_pointStr) - 7;//구분 문자열로 사용할 nm을 String문자열에서 찾을 땐 {"nm":" = 7
			_refSelDynamicStr = _refSelDynamicStr
					.substring(before);//자르기

			var after = _refSelDynamicStr.indexOf(_str)
					+ _str.length;
			_refSelDynamicStr = _refSelDynamicStr.substring(0,
					after);//자르기

			_dataStrAfterObj = JSON.parse(_refSelDynamicStr);

			for (var k = 0; k < _dataStrAfterObj.option.length; k++) {
				if (_dataStrAfterObj.option[k].val != undefined)
					_html += "<option value='"+_dataStrAfterObj.option[k].val+"' idx='"+_dataStrAfterObj.option[k].idx+"'>"
							+ _dataStrAfterObj.option[k].nm
							+ "</option>";
				else
					_html += "<option idx='"+_dataStrAfterObj.option[k].idx+"'>"
							+ _dataStrAfterObj.option[k].nm
							+ "</option>";
			}
			_str = _str.substring(0, _str.length - 2);//이 반복문을 빠져나갈 때 마다 트리 level이 하나씩 내려가므로, 맨 처음 시작할 때 "}]}]}"였던 _str을 "}"까지 빼줘야 함. 여기서 2개씩 빼주는 거임.
			_pointStr = _dataStrAfterObj.option[0].nm
					+ '","idx":"'
					+ _dataStrAfterObj.option[0].idx + '"'; //구분 문자열을 다음 select박스의 첫 번째 데이터 값으로 변경함.
		}
		_html += '	</select>';//select 만들기 완료
	}

	if (unitData.note != null || unitData.note != undefined) { //주석으로 저장되어있는 DB 데이터 표시하기
		for (var j = 0; j < unitData.note.length; j++) {
			_html += '<br>';
			_html += '<span class="util_text" style="font-weight:normal;">&nbsp;※'
					+ unitData.note[j] + '</span>';
		}
	}

	$('#targetDiv').html(_html);
}
		
function changeDymSlctRvsn(_this, _changeNum){//동적 select change될 때 마다 실행되는 함수
	//_this는 change 이벤트가 일어난 select box, _changeNum은 change 이벤트가 일어난 select box의 위치(load 함수에서 select박스 갯수만큼 자동으로 생성된 값임)
	var _dataStr;//DB의 트리데이터 문자열 담을 곳
	var _dataStrAfterObj;//DB의 트리데이터 문자열을 가공 후 Object로 저장할 곳
	var _stdGroupSelDynamic;
	var _parentCnt;//부모 갯수 저장
	var _siblings = _this.parent().children('select');//같은 level의 형제 select 저장
	
	var _point = _this; //change 이벤트가 일어난 select box 저장된 곳
	var _pointVal; //자르기를 시작할 문자열에서 구분 문자열
	
	if(unitData.type == 'sel_dynamic') {
	     _dataStr = JSON.stringify(unitData.ref_sel_dynamic); //DB의 트리데이터 문자열로 바꿔서 저장
	     _stdGroupSelDynamic = unitData.std_group_sel_dynamic;
	}
	
	var _parentCnt = _stdGroupSelDynamic.length - (_stdGroupSelDynamic.length - _changeNum);
	
	var _forStr = '}';//자르기를 마칠 문자열
	
	for(var j = 0; j < _stdGroupSelDynamic.length-1; j++){
		_forStr += ']}';
	}
	
	for(var i = 0; i < _parentCnt; i++){//DB 트리 데이터에서 부모 부분만 자르기
		_pointVal = _siblings.eq(i).val()+'","idx":"'+_siblings.find('option:selected').attr('idx')+'"';
		var before = _dataStr.indexOf(_pointVal) - 7;
		_dataStr = _dataStr.substring(before);
		
		var after = _dataStr.indexOf(_forStr) + _forStr.length;
		_dataStr = _dataStr.substring(0, after);
		
		_forStr = _forStr.substring(0, _forStr.length-2);
	}
	_pointVal = _point.val()+'","idx":"'+_point.find('option:selected').attr('idx')+'"';//구분 문자열 초기화
                     //이 시점에서 부터 저장해둔 DB 트리 데이터 문자열 변수인 _dataStr에는 change 이벤트가 일어난 select와 그 자식들만 들어 있음.
	
	for(var i = 0; i < _stdGroupSelDynamic.length - 1 - _parentCnt; i++){//change 이벤트가 일어난 select부터 처리하기 시작해서 그 자식들이 없을 때까지 처리하기 위해 loop 돌림
		
		var before = _dataStr.indexOf(_pointVal) - 7;
		_dataStr = _dataStr.substring(before);
		
		var after = _dataStr.indexOf(_forStr) + _forStr.length;
		_dataStr = _dataStr.substring(0, after);
		
		_dataStrAfterObj = JSON.parse(_dataStr);
		
		_point = _point.next();//change 이벤트가 일어난 select의 다음 select 엘레멘트로 포인트를 넘김
		_point.empty();
		_pointVal = _dataStrAfterObj.option[0].nm+'","idx":"'+_dataStrAfterObj.option[0].idx+'"';
		
		for(var j = 0; j < _dataStrAfterObj.option.length; j++){//넘어간 point에 값을 채움
			if(_dataStrAfterObj.option[j].val != undefined) _point.append("<option value="+_dataStrAfterObj.option[j].val+" idx='"+_dataStrAfterObj.option[j].idx+"'>"+_dataStrAfterObj.option[j].nm+"</option>");
			else _point.append("<option idx='"+_dataStrAfterObj.option[j].idx+"'>"+_dataStrAfterObj.option[j].nm+"</option>");
		}
		_forStr = _forStr.substring(0, _forStr.length-2);
	}
}
	</script>
</body>
</html>
