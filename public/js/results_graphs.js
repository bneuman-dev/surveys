$(document).ready( function () {

  $.each($(".graph"),function(){
    var width = 420
    var barHeight = 20;
    color = d3.scale.category20();

    dataSet = JSON.parse($(this).find("p").html());
    
    var data=[];
    var labels=[];
    
    $.each(dataSet,function(index,value){
      data.push(value.count);
      labels.push(value.answer);
    });

    
    var x = d3.scale.linear()
        .domain([0, d3.max(data)])
        .range([0, width]);

    var barLabelWidth = 400; // space reserved for bar labels
    var barLabelPadding = 5; // padding between bar and bar labels (left)
    var gridLabelHeight = 18; // space reserved for gridline labels
    var gridChartOffset = 3; // space between start of grid and first bar
    var valueLabelWidth = 40;
    var barLabel = function(d) { return d; };

    // scales
    var yScale = d3.scale.ordinal().domain(d3.range(0, labels.length)).rangeBands([0, labels.length * barHeight]);
    var y = function(d, i) { return yScale(i); };
    var yText = function(d, i) { return y(d, i) + yScale.rangeBand() / 2; };

    var chart = d3.select(this)
        .append("svg")
        .attr("width", width + barLabelWidth + valueLabelWidth)
        .attr("height",  gridLabelHeight + gridChartOffset + data.length * barHeight);


    

    var labelsContainer = chart.append('g')
      .attr('transform', 'translate(' + (barLabelWidth - barLabelPadding) + ',' + (gridLabelHeight + gridChartOffset) + ')'); 
    
    labelsContainer.selectAll('text').data(labels).enter().append('text')
      .attr('y', yText)
      .attr('stroke', 'none')
      .attr('fill', 'black')
      .attr("dy", ".35em") // vertical-align: middle
      .attr('text-anchor', 'end')
      .text(barLabel);

    var barContainer = chart.append('g')
      .attr('transform', 'translate(' + barLabelWidth + ',' + (gridLabelHeight + gridChartOffset) + ')'); 

    var bars = barContainer.selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function(d, i) { return "translate(0," + i * barHeight + ")"; });

    bars.append("rect")
        .attr("width", function(d) { return x(d); })
        .attr("height", barHeight - 1)
        .attr("fill", function(d, i) { return color(i); });

    bars.append("text")
        .attr("x", function(d) { return x(d) - 3; })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .attr("text-anchor", "end")
        .text(function(d) {if(d>0){return d}; });

  });
});
