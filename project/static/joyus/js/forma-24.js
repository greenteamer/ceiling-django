/* Form to Lead creator for Bitirix24
http://sipiko.net
*/
var incycle = 1;
var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
var eventer = window[eventMethod];
var iframe_ready = false;
var gotanswere = false;
var iframe;
var fieldobj_const = {
    "STATUS_ID": "NEW",
    "OPENED": "Y",
    "ASSIGNED_BY_ID": 1
};
var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";
eventer(messageEvent, function(e) {
    json_cont = JSON.parse(e.data);
    console.log(json_cont)
    if ("h" in json_cont) {
        str_child = json_cont
        console.log(str_child)
        hh = parseInt(str_child.h) + 20;
        document.getElementById('sipiko_if_b24lead').style.height = hh + 'px';
        document.getElementById('sipiko_if_b24lead').style.width = str_child.w + 'px';
		document.getElementById('sipiko_b24lead').style.height= hh + 'px';
		document.getElementById('sipiko_b24lead').style.width= str_child.w + 'px';
		document.getElementById('sipiko_b24lead').style.verticalAlign = 'middle';
		document.getElementById('sipiko_b24lead').style.display='table-cell';
        gotanswere = true;
		var my_awesome_script = document.createElement('script');
		my_awesome_script.id = "temp_getref";
		my_awesome_script.setAttribute('src','https://sip.evro-tel.com.ua/html/bitrix24/js/getreferer.js');

document.getElementById("sipiko_b24lead").appendChild(my_awesome_script);
    }

    if (json_cont["result"]) {
        document.getElementById("sipiko_b24lead").innerHTML = "<h3>Заявка принята с №" + json_cont["result"] + "</h3>";
		if(my_awesome_script)
		document.getElementById("sipiko_b24lead").removeChild(my_awesome_script);
    }
    if (json_cont["error"]) {
        document.getElementById("sipiko_b24lead").innerHTML = "<h3>Ошибка " + json_cont["result"] + "</h3>";
		if(my_awesome_script)
		document.getElementById("sipiko_b24lead").removeChild(my_awesome_script);
    }
}, false);

window.onload = function() {
    var nameb = document.getElementById("b24_form").getAttribute("data-name");
    name_filearr = atob(nameb)
    resarr = name_filearr.split("@");
    name_domain = resarr[0];
    name_file = resarr[1];
	resarr2 = name_file.split("_");
	notify_userid = resarr2[0];
	console.log("notify_userid >>>>>>>"+notify_userid)
    var link = "https://sip.evro-tel.com.ua/html/bitrix24/third_type_ou_localt.php?portal=" + name_domain + "&filename=" + name_file
    var iframe = document.createElement('iframe');
    iframe.frameBorder = 0;
    iframe.width = "300px";
    iframe.height = "250px";
    iframe.id = "sipiko_if_b24lead";
    iframe.onload = function() {
        return function() {
			if(iframe_ready == false)
			powereBySipiko();
            iframe_ready = true;
            console.log("incycle: " + incycle);
            setTimeout(function() {
                if (gotanswere == false && incycle < 3) {
                    iframe.setAttribute("src", link);
                }
            }, 500);
            incycle++;
        }
    }();
    iframe.setAttribute("src", link);

    document.getElementById("sipiko_b24lead").appendChild(iframe);

}
