document.addEventListener('DOMContentLoaded', function() {
 
	  function setColor(number, progressBarDone){
		  if(number <= 4){
			  progressBarDone.style.background = 'red';
		  }
		  if(number > 4 && number <= 7){
			  progressBarDone.style.background = 'yellow';
		  }
		  if(7 < number){
			  progressBarDone.style.background = 'green';
		  }
	  }
	
	  function setPosition(percent, progressBarDone) {
		  progressBarDone.style.width = percent +'%';
	   }
	 
	  setInterval(function() {
		var progressBarDoneList = document.getElementsByClassName('progressBarDone');
		for (var i = 0; i < progressBarDoneList.length; i++){
			var progressBarDone = progressBarDoneList[i];
			var number = Number.parseInt(progressBarDone.firstChild.nodeValue);
			setColor(number,progressBarDone);
			
			var targetPos = progressBarDone.getBoundingClientRect().top;
		    var alredyStarted = progressBarDone.getAttribute('alredyStarted');

		    
		    if(alredyStarted == true || $(window).height() > targetPos){
		    	var number = Number.parseInt(progressBarDone.firstChild.nodeValue);
				var percent = Number.parseFloat(progressBarDone.getAttribute('percent'));
				if (!percent){
					percent = -20;
				}
				percent = percent < 10*number ? percent + 0.2 : 10*number;
			    
			    progressBarDone.setAttribute('percent', percent);
			    progressBarDone.setAttribute('alredyStarted', true);
			    if (percent > 0){
			    	setPosition(percent, progressBarDone);
			    } else {
			    	setPosition(0, progressBarDone);
			    }
		    } else {
		    	setPosition(0, progressBarDone);
		    }
		}
	  }, 0);
	  
  });