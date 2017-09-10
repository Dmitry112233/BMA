document.addEventListener('DOMContentLoaded', function() {
 
 <!-- задаем начальный percent ширины ProgressBarDone равный нулю -->
  var percent = 0;
  
  var progressBarDone = document.getElementsByClassName('progressBarDone')[0];
 
<!-- задаем конечный percent ширины ProgressBarDone (от 1 до 10) --> 
  var number = 6;
  
<!--функция задающая цвет ProgressBarDone в зависимости от оценки-->  
  function setColor(number){
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

<!--устонавливаем ширину ProgressBarDone равную percent-->  
  function setPosition(percent) {
	  progressBarDone.style.width = percent +'%';
   }
 
<!--Основная функция: если percent меньше 10*number(конечная ширина), то percent+1, иначе percent = 10*number. После вызываем функцию установки цвета и ширины ProgressBarDone--> 
  setInterval(function() {
    percent = percent < 10*number ? percent + 1 : 10*number;
    setColor(number);
    setPosition(percent);
  }, 0.5);
  
  });