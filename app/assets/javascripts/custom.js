$(document).ready(function() {
  // $('a.page-scroll').bind('click', function(event) {
  //     var $anchor = $(this);
  //     $('html, body').stop().animate({
  //         scrollTop: ($($anchor.attr('href')).offset().top - 50)
  //     }, 1250, 'easeInOutExpo');
  //     event.preventDefault();
  // });
  //
  // // Highlight the top nav as scrolling occurs
  // $('body').scrollspy({
  //     target: '.navbar-fixed-top',
  //     offset: 100
  // });
  //
  // // Closes the Responsive Menu on Menu Item Click
  // $('.navbar-collapse ul li a').click(function() {
  //     $('.navbar-toggle:visible').click();
  // });
  //
  // // Offset for Main Navigation
  // $('#mainNav').affix({
  //     offset: {
  //         top: 50
  //     }
  // });
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
});
