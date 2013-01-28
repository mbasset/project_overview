/*
 * General algorithmn for hex colurs adapted from: http://paulirish.com/2009/random-hex-color-code-snippets/
 */

$(function() {
	$(".po_team_member").each(function( index, element ) {
		var $this = $(element);
		var colours =	["#F7977A", "#FDC68A", "#FFF79A", "#C4DF9B", "#7BCDC8", "#7EA7D8", "#BC8DBF", "#F6989D"];
		
		var bg = parseInt($this.find(".name").data("id")) % colours.length;
		$this.css("background-color", colours[bg]);
	});
});