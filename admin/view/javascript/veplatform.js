(function (window) {
    'use strict';
    var products = [
        {
            productInfoContent: "vecontact_info_content"
        },
        {
            productInfoContent: "vechat_info_content"
        },
        {
            productInfoContent: "veassist_info_content"
        },
        {
            productInfoContent: "veads_info_content"
        }
    ];
    var cursorLogo = [
        {
            logoId: "veadsLogo",
            check: "adsCb"
        },
        {
            logoId: "veassistLogo",
            check: "assistCb"
        },
        {
            logoId: "vechatLogo",
            check: "chatCb"
        },
        {
            logoId: "vecontactLogo",
            check: "contactCb"
        }
    ];

    function veCursorLogo() {
        for (var i = 0; i < cursorLogo.length; i++) {
            var checkStatus = document.getElementById(cursorLogo[i].check);
            if (checkStatus.disabled) {
                document.getElementById(cursorLogo[i].logoId).className = "click_locked";
            }
        }
    }

    function veProductCloseInfo(currentEvent, me, infoContentId) {
        var infoContent = document.getElementById(infoContentId);
        infoContent.className = "hidden";
    }

    function veProductOpenInfo(currentEvent, me, infoContentId) {
        var infoContent = document.getElementById(infoContentId);

        if (infoContent.className == "") {
            infoContent.className = "hidden";

            return;
        }

        for (var i = 0; i < products.length; i++) {
            document.getElementById(products[i].productInfoContent).className = "hidden";
        }
        infoContent.className = "";
    }

    var veEvents = {
        "vecontact_moreinfo": {
            "click": {
                prevent: true,
                funct: veProductOpenInfo,
                args: ["vecontact_info_content"]
            }
        },
        "vecontact_closeinfo": {
            "click": {
                prevent: true,
                funct: veProductCloseInfo,
                args: ["vecontact_info_content"]
            }
        },
        "vechat_moreinfo": {
            "click": {
                prevent: true,
                funct: veProductOpenInfo,
                args: ["vechat_info_content"]
            }
        },
        "vechat_closeinfo": {
            "click": {
                prevent: true,
                funct: veProductCloseInfo,
                args: ["vechat_info_content"]
            }
        },
        "veassist_moreinfo": {
            "click": {
                prevent: true,
                funct: veProductOpenInfo,
                args: ["veassist_info_content"]
            }
        },
        "veassist_closeinfo": {
            "click": {
                prevent: true,
                funct: veProductCloseInfo,
                args: ["veassist_info_content"]
            }
        },
        "veads_moreinfo": {
            "click": {
                prevent: true,
                funct: veProductOpenInfo,
                args: ["veads_info_content"]
            }
        },
        "veads_closeinfo": {
            "click": {
                prevent: true,
                funct: veProductCloseInfo,
                args: ["veads_info_content"]
            }
        }
    };
    function allProductsActivated() {
        var checks = ['contactCb', 'chatCb', 'assistCb', 'adsCb'];
        var b = true;
        for (var i = 0; i < checks.length; i++) {
            b = b && document.getElementById(checks[i]).disabled;
        }
        if (b) {
            document.getElementById("activate_product_btn").style.display = "none";
            document.getElementById("confirm_selection_btn").disabled = true;
        }
        else {
            document.getElementById("activate_product_btn").style.display = "inline";
            document.getElementById("confirm_selection_btn").disabled = false;
        }
    }

    function veAddEvent(evnt, elem, func) {
        if (elem.addEventListener) { // W3C DOM
            elem.addEventListener(evnt, func, false);
        } else if (elem.attachEvent) { // IE DOM
            elem.attachEvent("on" + evnt, func);
        } else { // No much to do
            elem[evnt] = func;
        }
    }

    function veCall(currentEvent, me, funct, args) {
        var new_args;

        if (typeof funct === "function") {
            new_args = [currentEvent, me];
            if (args) new_args = new_args.concat(args);
            funct.apply(null, new_args);
        }
    }

    window.onload = function (onloadEvent) {

        var onloadEvent = onloadEvent || window.event;

        for (var elementId in veEvents) {
            if (veEvents.hasOwnProperty(elementId)) {
                for (var eventId in veEvents[elementId]) {
                    if (veEvents[elementId].hasOwnProperty(eventId)) {
                        if (eventId == "load") {
                            veCall(onloadEvent, document.getElementById(elementId), veEvents[elementId][eventId].funct, veEvents[elementId][eventId].args);
                        }
                        else {
                            veAddEvent(eventId, document.getElementById(elementId), function (currentEvent) {
                                var currentEvent = currentEvent || window.event;

                                if (veEvents[this.id][currentEvent.type].prevent) currentEvent.preventDefault();
                                veCall(currentEvent, this, veEvents[this.id][currentEvent.type].funct, veEvents[this.id][currentEvent.type].args);
                            });
                        }
                    }
                }
            }
        }
        CheckUnchecked();
        veCursorLogo();
        allProductsActivated();
    };
}(window));

function veLogo(targetId) {
    var trg = document.getElementById(targetId);
    if (!trg.disabled) {
        trg.checked = !trg.checked;
        buttonStatus();
    }
}

function buttonStatus() {
    var checks = ['contactCb', 'chatCb', 'assistCb', 'adsCb'];
    var b = true;
    for (var i = 0; i < checks.length; i++) {
        if (!document.getElementById(checks[i]).disabled) {
            b = b && !document.getElementById(checks[i]).checked;
        }
    }
    if (b) {
        document.getElementById("activate_product_btn").style.display = "none";
        document.getElementById("confirm_selection_btn").disabled = true;
    }
    else {
        document.getElementById("activate_product_btn").style.display = "inline";
        document.getElementById("confirm_selection_btn").disabled = false;
    }
}
function CheckUnchecked() {
    var checks = ['contactCb', 'chatCb', 'assistCb', 'adsCb'];
    for (var i = 0; i < checks.length; i++) {
        switch (checks[i]) {
            case 'contactCb':
                var contactCheck = document.getElementById("veContactInstalled").textContent;
                CheckCheckbox(contactCheck, checks[i]);
                break;
            case 'chatCb':
                var chatCheck = document.getElementById("veChatInstalled").textContent;
                CheckCheckbox(chatCheck, checks[i]);
                break;
            case 'assistCb':
                var assistCheck = document.getElementById("veAssistInstalled").textContent;
                CheckCheckbox(assistCheck, checks[i]);
                break;
            case 'adsCb':
                var adsCheck = document.getElementById("veAdsInstalled").textContent;
                CheckCheckbox(adsCheck, checks[i]);
                break;
        }
    }
}
function CheckCheckbox(isInstalled, id) {
    if (isInstalled == true) {
        document.getElementById(id).disabled = true;
    }
}

$(document).ready(function () {
    $('a[href*=#]').click(function () {
        if ($(window).width() < 1120) {
            /*if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
            && location.hostname == this.hostname) {*/
                var $target = $(this.hash);
                $target = $target.length && $target
                || $('[name=' + this.hash.slice(1) + ']');
                if ($target.length) {
                    var targetOffset = $target.offset().top;
                    $('html,body')
                    .animate({ scrollTop: targetOffset }, 1000);
                    return false;
                }
            //}
        }
    });
});