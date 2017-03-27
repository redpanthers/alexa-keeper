$(document).ready(function() {
   

  var slider = ["ALERT","SMART","COMPETITIVE"];
  $("#animate").addClass('animated infinite fadeInDown');
  $("#animate").text(slider[0]);
  var i = 1;
  window.setInterval(function(){
      if(i>=slider.length) {
          i=0;
      }
      $("#animate").text(slider[i]);
      i++;
  }, 3015);
  if($('#graph').length){
    $.getJSON('/static_pages/show', function(data) {
        console.log(data)
        $('#graph').highcharts({
	    chart: {
		    zoomType: 'x'
	    },
            title: {
                text: 'Alexa Keeper',
                x: -20 //center
            },
            subtitle: {
                text: 'Source: alexa.com',
                x: -20
            },
            xAxis: {
                categories: data[0]['date'],
                min: 0
            },
            yAxis: {
                reversed : 'true',
                title: {
                    text: 'Ranks'
                },
                labels: {
                    formatter: function() {
                        var rate = this.value;
                        if (rate > 999999) {
                            rate = Math.round((rate / 1000000) * 100) / 100 + " M";
                        } else if (rate > 999 && rate < 1000000) {
                            rate = Math.round((rate / 1000) * 100) / 100 + " k";
                        }
                        return rate;
                    }
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: ''
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: data
        });
    })
  }




var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].onclick = function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + 'px';
    } 
  }
}
   
   var scroll_start = 0;
   var startchange = $('#startchange');
   var offset = startchange.offset();
    if (startchange.length){
   $(document).scroll(function() { 
      scroll_start = $(this).scrollTop();
      if(scroll_start > offset.top) {
          $(".navbar-default").css('background-color', 'white');
          $(".navbar-default,.nav,li,a").css('color', 'black');
          $(".btn-outline").css('color', 'white'); 
          $("footer ul li a").css('color', 'rgba(255,255,255,0.3)'); 
         
       } else {
          $('.navbar-default').css('background-color', 'transparent');
          $(".navbar-default,.nav,li,a").css('color', 'white');
       }
   });
    }
});

$( "#invite" ).click(function() {
  $("#invite").attr("disabled", true);
})

  
