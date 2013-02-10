/*
 * General algorithmn for hex colurs adapted from: http://paulirish.com/2009/random-hex-color-code-snippets/
 */

var po_team_colourize = function(elements) {
	elements = typeof elements !== 'undefined' ? elements : $(".po_team_member");
	elements.each(function( index, element ) {
		var $this = $(element);
		var colours =	["#FFF1ED", "#FDECDA", "#FFFCD9", "#EEFFD4", "#EDFFFE", "#E0EEFF", "#F4E6F5", "#FFE8E9"];
		
		var bg = parseInt($this.find(".name").data("id")) % colours.length;
		$this.css("background-color", colours[bg]);
	});
};

$(function() {
	po_team_colourize;
});
