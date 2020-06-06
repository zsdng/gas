<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>日历事件</title>
    <meta name="description" content="Restyling jQuery UI Widgets and Elements" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- basic styles -->

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" />

    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/fullcalendar.css" />

    <!-- fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
    <!-- ace styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/ace-skins.min.css" />
    <!--[if lte IE 8]
      <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="${pageContext.request.contextPath}/static/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--		[if lt IE 9
            <script src="assets/js/html5shiv.js"></script>
            <script src="assets/js/respond.min.js"></script>
            <![endif]-->
</head>

<body class="no-skin">


<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">


    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <!-- #section:basics/content.breadcrumbs -->
        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">
            <!-- /section:settings.box -->
            <div class="page-content-area">
                <div class="row">
                    <h1>日历插件</h1>
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-sm-9">
                                <div class="space"></div>

                                <div id="calendar"></div>
                            </div>

                            <div class="col-sm-3">
                                <div class="widget-box transparent">
                                    <div class="widget-header">
                                        <h4>可拖拽事件</h4>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main no-padding">
                                            <div id="external-events">
                                                <div class="external-event label-grey" style="text-align: center" data-class="label-grey">
                                                    <i class="icon-move"></i>
                                                    日常提醒
                                                </div>

                                                <div class="external-event label-success" style="text-align: center" data-class="label-success">
                                                    <i class="icon-move"></i>
                                                   开会提醒
                                                </div>

                                                <div class="external-event label-danger" style="text-align: center" data-class="label-danger">
                                                    <i class="icon-move"></i>
                                                    重要事件
                                                </div>

                                                <div class="external-event label-purple" style="text-align: center" data-class="label-purple">
                                                    <i class="icon-move"></i>
                                                    放假提醒
                                                </div>

                                                <div class="external-event label-yellow" style="text-align: center" data-class="label-yellow">
                                                    <i class="icon-move"></i>
                                                    来气提醒
                                                </div>

                                                <div class="external-event label-pink" style="text-align: center" data-class="label-pink">
                                                    <i class="icon-move"></i>
                                                    送气提醒
                                                </div>

                                                <div class="external-event label-info" style="text-align: center" data-class="label-info">
                                                    <i class="icon-move" ></i>
                                                    默认事件
                                                </div>

                                                <form action="${pageContext.request.contextPath}/calendar/addCal" method="post" id="form111" >
                                                    <div class="external-event label-info" style="text-align: center" data-class="label-info">

                                                        　　<label class="control-label">输入时间和事件:</label>
                                                    </div>
                                                        　　　　<div class="input-group date form_datetime col-md-12 startDate"  data-date-format="yyyy-mm-dd hh:ii " data-link-field="startDate">
                                                        　　　　开始时间<input class="form-control" size="16" name="start" type="text" value="" readonly id="start111">
                                                        　　　　<span class="input-group-addon" style="height: 5px"><span style="height: 5px" class="glyphicon glyphicon-remove"></span></span>
                                                        　　　　<span class="input-group-addon" style="height: 5px"><span style="height: 5px" class="glyphicon glyphicon-th"></span></span>
                                                        　　</div>
                                                        　　<input type="hidden" id="startDate" value="" /><br/>

                                                    <div class="form-group">
                                                        　　<div class="input-group date form_datetime col-md-12 endDate" data-date-format="yyyy-mm-dd hh:ii " data-link-field="endDate">
                                                        　　　　结束时间<input class="form-control" size="5" style="margin-right: 0" name="end" type="text" value="" id="end111" readonly>
                                                        　　　　<span class="input-group-addon" ><span  class="glyphicon glyphicon-remove"></span></span>
                                                        　　　　<span class="input-group-addon" ><span  class="glyphicon glyphicon-th"></span></span>
                                                        　　</div>
                                                        　　<input type="hidden" id="endDate" value="" /><br/>
                                                    </div>

                                                        <i class="icon-move" ></i>

                                                    事件<input type="text" name="title" id="title111"><br>
                                                    事件类型<select name="classname" class="form-control">
                                                        <option value="info">默认事件</option>
                                                        <option value="grey" >日常提醒</option>
                                                        <option value="success">开会提醒</option>
                                                        <option value="danger">重要事件</option>
                                                        <option value="purple">放假提醒</option>
                                                        <option value="yellow">来气提醒</option>
                                                        <option value="pink">送气提醒</option>

                                                    </select><br>
                                                      <div style="text-align: center"> <a onclick="sub111();" class="btn btn-default">添加</a></div>
                                                </form>
                                                    <form action="${pageContext.request.contextPath}/calendar/addCal" method="post" id="form222">
                                                <div class="external-event label-info" style="text-align: center" data-class="label-info">
                                                   开始时间 <input type="text"  placeholder="yyyy-MM-dd HH:mm" id="start222"><br>
                                                    结束时间 <input type="text" placeholder="yyyy-MM-dd HH:mm" id="end222" ><br>
                                                    &nbsp; &nbsp;&nbsp;事件<input type="text" name="title" id="title222"><br>
                                                    <i class="icon-move" ></i>
                                                </div>

                                                <div class="external-event label-info" style="text-align: center" data-class="label-info">
                                                    <a class="btn btn-default"  style="background-color: #65ddff" onclick="sub222();">添加</a>
                                                </div>

                                                </form>

                                                <form action="${pageContext.request.contextPath}/calendar/delCal" method="post" >
                                                <div class="external-event label-info" style="text-align: center" data-class="label-info">
                                                    <input type="text" placeholder="请输入事件名称" name="title">
                                                    <input type="submit" style="background-color: #65ddff" value="删除事件">
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content-area -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->


    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/js/jquery-2.1.0.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/static/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->
<script src="${pageContext.request.contextPath}/static/js/jquery-ui-1.10.3.custom.min.js"></script>
<!--		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>-->
<script src="${pageContext.request.contextPath}/static/js/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-datetimepicker.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.zh-TW.js"
        charset="UTF-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/locales/bootstrap-datetimepicker.fr.js"
        charset="UTF-8"></script>

<script>
    $('.startDate').datetimepicker({
        language:'zh-CN',
        // format: 'yyyy-mm-dd', //时间显示格式 年-月-日
        autoclose:true, //选择完时间后自动关闭，默认false（不关闭）
        startView: 2,
        minView: 2,
        todayBtn:true,
        todayHighlight: 1,
        pickerPosition:'bottom-left',
        forceParse: 0,
        weekStart: 1,
        showMeridian: 1
    }).on('changeDate',function(ev){
        var startTime = $('#startDate').val();

        $('.startDate').datetimepicker('hide');

        $('.endDate').datetimepicker('setStartDate',startTime);
    });
    $('.endDate').datetimepicker({
        language:'zh-CN',
        // format: 'yyyy-mm-dd', //时间显示格式 年-月-日 时：分
        minView: 2,
        pickerPosition:'bottom-left',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1

    }).on('changeDate',function(ev){
        //var startTime = $('#startDate').val();
        var endTime = $('#endDate').val();
        $('.startDate').datetimepicker('setEndDate',endTime);
        $('.endDate').datetimepicker('hide');
    });

    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });



</script>
<script>
    function sub111() {
        if ($("#start111").val()==null||$("#start111").val()==""){
            alert("请输入开始时间");
        }else if ($("#end111").val()==null||$("#end111").val()==""){
            alert("请输入开始时间");
        }else if ($("#title111").val()==null||$("#title111").val()==""){
            alert("请输入事件名称");
        }else{
            $("#form111").submit();
            alert("添加成功！")
        }
    }

    function sub222() {
        if ($("#start222").val()==null||$("#start222").val()==""){
            alert("请输入开始时间");
        }else if ($("#end222").val()==null||$("#end222").val()==""){
            alert("请输入开始时间");
        }else if ($("#title222").val()==null||$("#title222").val()==""){
            alert("请输入事件名称");
        }else{
            $("#form222").submit();
            alert("添加成功！")
        }
    }

</script>

<!-- 这个是为了让日期开始时间小于结束时间-->
<script type="text/javascript">



    jQuery(function($) {
        /* initialize the external events
            -----------------------------------------------------------------*/
        $('#external-events div.external-event').each(function() {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
                title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
                zIndex: 999,
                revert: true,      // will cause the event to go back to its
                revertDuration: 0  //  original position after the drag
            });

        });

        /* initialize the calendar
        -----------------------------------------------------------------*/

        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        var initialLocaleCode = 'zh-cn';


        var calendar = $('#calendar').fullCalendar({


            buttonText: {
                today: '今天',
                month: '月视图',
                week: '周视图',
                day: '日视图',
                prev: '<i class="icon-chevron-left">后退</i>',
                next: '<i class="icon-chevron-right">前进</i>'
            },
            allDayText: "全天",
            timeFormat: {
                '': 'H:mm{-H:mm}'
            },
            weekMode: "variable",
            columnFormat: {
                month: 'dddd',
                week: 'dddd M-d',
                day: 'dddd M-d'
            },
            titleFormat: {
                month: 'yyyy年 MMMM月',
                week: "[yyyy年] MMMM月d日 { '&#8212;' [yyyy年] MMMM月d日}",
                day: 'yyyy年 MMMM月d日 dddd'
            },
            monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
            dayNames: ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],


            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            navLinks: true, // can click day/week names to navigate views
            locale:'zh-cn',

            events:
        [
            <c:forEach items="${calendars}" var="e" varStatus="s">
                {
                    title: "${e.title}",
                    start: new Date(${e.start.year}+1900, ${e.start.month}, ${e.start.date},${e.start.hours}, ${e.start.minutes}),
                    end: new Date(${e.end.year}+1900, ${e.end.month}, ${e.end.date}, ${e.end.hours}, ${e.end.minutes}),
                    allDay: false,
                    className: 'label-${e.classname}'
                },
                </c:forEach>
            ],


            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar !!!
            drop: function(date, allDay) { // this function is called when something is dropped

                // retrieve the dropped element's stored Event Object
                var originalEventObject = $(this).data('eventObject');
                var $extraEventClass = $(this).attr('data-class');


                // we need to copy it, so that multiple events don't have a reference to the same object
                var copiedEventObject = $.extend({}, originalEventObject);

                // assign it the date that was reported
                copiedEventObject.start = date;
                copiedEventObject.allDay = allDay;
                if($extraEventClass) copiedEventObject['className'] = [$extraEventClass];

                // render the event on the calendar
                // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                // is the "remove after drop" checkbox checked?
                if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                }
            }
            ,
            selectable: true,
            selectHelper: true,

            select: function(start, end, allDay) {
                bootbox.prompt("添加新事件：", function(title) {
                    if (title !== null) {
                        calendar.fullCalendar('renderEvent',
                            {
                                title: title,
                                start: start,
                                end: end

                                // allDay: allDay
                            },
                            true // make the event "stick"
                        );


                    }

                });


                calendar.fullCalendar('unselect');

            }
            ,

            eventClick: function(calEvent, jsEvent, view) {

                var form = $("<form class='form-inline' id='form1' action='../calendar/del ' method='post'><label>修改事件名称 &nbsp;</label></form>");
                form.append("<input class='middle'   type=text value='" + calEvent.title+"' /> ");
                form.append("<input class='hidden' name='cid' value='12'>");
                form.append("<button type='submit' id='su1' class='btn btn-sm btn-success'><i class='icon-ok'></i> 修改</button>");

                var div = bootbox.dialog({
                    message: form,
                    buttons: {
                        "delete" : {
                            "label" : "<i class='icon-trash'></i> 删除事件",
                            "className" : "btn-sm btn-danger",
                            "callback": function() {

                                calendar.fullCalendar('removeEvents' , function(ev){

                                    return (ev._id == calEvent._id);


                                })
                            }

                        } ,
                        "close" : {
                            "label" : "<i class='icon-remove'></i> 关闭",
                            "classname" : "btn-sm"
                        }
                    }

                });


                form.on('submit', function(){

                    calEvent.title = form.find("input[type=text]").val();
                    calendar.fullCalendar('updateEvent', calEvent);
                    $("#form1").submit();
                    div.modal("hide");

                    return false;
                });


                console.log(calEvent.id);
                //console.log(jsEvent);
                //console.log(view);

                // change the border color just for fun
                //$(this).css('border-color', 'red');

            }

        });


    });


</script>

</body>
</html>

