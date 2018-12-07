
//获取地址栏参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]); return null; //返回参数值
}

//json日期格式转换为正常格式
function jsonDateFormat(jsonDate) {
    try {
        var date = new Date(parseInt(jsonDate.replace("/Date(", "").replace(")/", ""), 10));
        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var day = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();
        var milliseconds = date.getMilliseconds();
        return date.getFullYear() + "-" + month + "-" + day + " " + hours + ":" + minutes + ":" + seconds + "." + milliseconds;
    } catch (ex) {
        return "";
    }
}

//发送ajax
//data 数据
//返回1为成功,0为失败
function ajaxFun(data, url) {
    var result;
    $.ajax({
        async: false,
        type: "post",
        url: url,
        data: data,
        dataType: "text",
        success: function (data) {
            result = data;
        }
    });
    return result;
}

//发送ajax
//data 数据
//返回json对象
function ajaxFunObj(data, url) {
    var result;
    $.ajax({
        async: false,
        type: "post",
        url: url,
        data: data,
        dataType: "json",
        success: function (data) {
            result = data;
        }
    });
    return result;
}

//消息弹出框
//title 弹出消息
//type 消息类型1.success 2.error
function showBox(title,type) {
    swal({
        title: title,
        type: type,
        confirmButtonText: "确定",
        timer: 1000
    });
}

//获取当前时间,格式 2015-09-05 10:00:00.000 
function getnowtime() {
    var nowtime = new Date();
    var year = nowtime.getFullYear();
    var month = padleft0(nowtime.getMonth() + 1);
    var day = padleft0(nowtime.getDate());
    var hour = padleft0(nowtime.getHours());
    var minute = padleft0(nowtime.getMinutes());
    var second = padleft0(nowtime.getSeconds());
    var millisecond = nowtime.getMilliseconds(); millisecond = millisecond.toString().length == 1 ? "00" + millisecond : millisecond.toString().length == 2 ? "0" + millisecond : millisecond;
    return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second + "." + millisecond;
}
//补齐两位数  
function padleft0(obj) {
    return obj.toString().replace(/^[0-9]{1}$/, "0" + obj);
}

//格式化日期
function formatDate(date) {
    var d = new Date(date),
      month = '' + (d.getMonth() + 1),
      day = '' + d.getDate(),
      year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

//比较日期
function checkEndTime(startTime, endTime) {
    var start = new Date(startTime.replace("-", "/").replace("-", "/"));
    var end = new Date(endTime.replace("-", "/").replace("-", "/"));
    if (end < start) {
        return false;
    }
    return true;
}

//去除数组重复元素
function uniq(arr) {
    var a = [],
        o = {},
        i,
        v,
        len = arr.length;
    if (len < 2) {
        return arr;
    }
    for (i = 0; i < len; i++) {
        v = arr[i];
        if (o[v] !== 1) {
            a.push(v);
            o[v] = 1;
        }
    }
    return a;
}