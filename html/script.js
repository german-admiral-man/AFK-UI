$(function() {
    function display(bool) {
        if (bool) {
            $('.container').show();
        } else {
            $('.container').hide();
        }
    }
    
    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post("https://afk-ui/escape", JSON.stringify({}));
			return
        }
    };
    $('#close').click(function() {
        $.post("https://afk-ui/escape", JSON.stringify({}));
		return
    });
    $('#submit').click(function() {
        let inputText = $('#input').val()
        if (inputText.length >= 20) {
            $.post("https://afk-ui/fatal", JSON.stringify({
                fatal: "Weniger als 20 Wörter nur erlaubt"
            }))
			return
        } else if (!inputText) {
            $.post("https://afk-ui/fatal1", JSON.stringify({
                fatal1: "Bitte gebe etwas ein"
            }))
			return
        }
        $.post("https://afk-ui/playerAFK", JSON.stringify({
            text: inputText,
        }));
		return;
    })
})