document.addEventListener('DOMContentLoaded', function() {
 
	  function setColor(number, progressBarDone){
		  if(number <= 4){
			  progressBarDone.style.background = '#c5df9b';			  
		  }
		  if(number > 4 && number <= 7){
			  progressBarDone.style.background = '#c5df9b';			  
		  }
		  if(7 < number){
			  progressBarDone.style.background = '#c5df9b';			  
		  }
	  }
	
	  function setPosition(percent, progressBarDone) {
		  progressBarDone.style.width = percent +'%';
	   }
	 
	  setInterval(function() {
		var progressBarDoneList = document.getElementsByClassName('progressBarDone');
		var progressBarList = document.getElementsByClassName('progressBar');
		for (var i = 0; i < progressBarDoneList.length; i++){
			var progressBarDone = progressBarDoneList[i];
			var number = Number.parseInt(progressBarDone.firstChild.firstChild.nodeValue);
			if(number <= 4){
				progressBarList[i].style.background = '#6f7860';			  
			  }
			  if(number > 4 && number <= 7){
				  progressBarList[i].style.background = '#6f7860';			  
			  }
			  if(7 < number){
				  progressBarList[i].style.background = '#6f7860';			  
			  }
			setColor(number,progressBarDone);
			
			var targetPos = progressBarDone.getBoundingClientRect().top;
		    var alredyStarted = progressBarDone.getAttribute('alredyStarted');

		    
		    if(alredyStarted == true || $(window).height() > targetPos){
		    	var number = Number.parseInt(progressBarDone.firstChild.firstChild.nodeValue);
				var percent = Number.parseFloat(progressBarDone.getAttribute('percent'));
				if (!percent){
					percent = -20;
				}
				percent = percent < 10*number ? percent + 0.6 : 10*number;
			    
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