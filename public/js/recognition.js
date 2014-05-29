var finalTranscript = '';
var recognizing = false;

$(document).ready(function() {

  if (!('webkitSpeechRecognition' in window)) {
    alert("Sorry, your Browser does not support the Speech API");
  } else {
    var recognition        = new webkitSpeechRecognition();
    recognition.continuous = true;
    recognition.lang       = 'en-US';

    recognition.onstart = function() {
      recognizing = true;
      $('#instructions').html('Say the color I have');
      $('#start_button').html('Stop');
    };

    recognition.onerror = function(event) {
      $('#instructions').html('There was a recognition error...');
    };

    recognition.onend = function() {
      recognizing = false;
      $('#instructions').html('&nbsp;');
    };

    recognition.onresult = function(event) {
      for (var i = event.resultIndex; i < event.results.length; ++i) {
        if (event.results[i].isFinal) {
          finalTranscript += event.results[i][0].transcript;
        }
      }

      if(finalTranscript.length > 0) {
        $('#color').val(finalTranscript);
        recognition.stop();
        $('#start_button').html('Start');
        recognizing = false;
        $("#form").submit();
      }
    };

    $("#start_button").click(function(e) {
      e.preventDefault();

      if (recognizing) {
        recognition.stop();
        $('#start_button').html('Start');
        recognizing = false;
      } else {
        finalTranscript = '';
        // Request access to the User's microphone and Start recognizing voice input
        recognition.start();
        //$('#instructions').html('Allow the browser to use your Microphone');
        //$('#start_button').html('waiting');
        //$('#transcript').html('&nbsp;');
      }
    });
  }
});
