



bet = {
	"start_date" : "2014-12-07T02:19:38.000Z",
	"end_date" : "2014-12-07T07:19:38.000Z",
	"description" : "Description test",
	"prize" : "Prize test",
	"user_url" : "video1.com",
	"dared_user_url" : "video2.com"
};
token="CAAVU4lNJQLwBAPgp81BD3TeCBm88y6u4Ki0usUx19YqQ752IiHiJqb5tH0PkUKUpL6sbxVZC36FZAZCzZBF2PyNWcGWL4DaxUenY0fn3ZCsY6pC6mmVkvMvih2Y7T179yqokmj158bBebpaDGFRZBaV4wfGu2VL12rPN4uZAnKqqFUR2KklqIVxOS6roZCE2LIMeKe3TgODXAZBhecc0LkOQ6";
data = {
	"bet" : bet,
	"facebook_token" : token,
	"user" : "teste@teste.com",
	"dared_user" : "teste@teste.com"
};

$.ajax({
    type: "POST",
    url: "http://localhost:3000/api1/users/create_bet.json",
    data: JSON.stringify(data),
    dataType: "json",
    contentType: 'application/json',
		success: function(res) {
                        console.log(res);
                           }
  });

$.ajax({
    type: "GET",
    url: "http://localhost:3000/api1/users/bet_info.json",
    data: {"user" : "teste@teste.com"},
    dataType: "json",
    contentType: 'application/json',
		success: function(res) {
                        console.log(res);
                           }
  });

