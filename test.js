



bet = {
	"start_date" : "2014-12-07T02:19:38.000Z",
	"end_date" : "2014-12-07T07:19:38.000Z",
	"description" : "Description test",
	"prize" : "Prize test",
	"user_url" : "video1.com",
	"dared_user_url" : "video2.com"
};
token="CAAVU4lNJQLwBAPWl0ljuexpIsvTLLMuS7mk6L22ZADjtKITjNbj46rpBBlI9MphZAYt6tObTJbdwQNALgZCDk6kyEgo7FydEHVQ6YAsocBKZAcmNCTQR5p8FVOnB67Bg2xVU13ZAwPK3cpdyjSmkZC8X28uLghXXqqdv9n73OSxnoVL18iccIU76zDX2ZANoJwUCal2QQ3K4A0dJNMgIQjX";
data = {
	"bet" : bet,
	"facebook_token" : token,
	"user" : "10202404085938250",
	"dared_user" : "10202404085938250"
};

$.ajax({
    type: "POST",
    url: "http://localhost:3000/api1/users/create_bet.json",
    data: JSON.stringify(data),
    dataType: "json",
    contentType: 'application/json',
		success: function(res) {console.log(res);}
});

$.ajax({
    type: "GET",
    url: "http://localhost:3000/api1/users/bet_info.json",
    data: {"user" : "10202404085938250"},
    dataType: "json",
    contentType: 'application/json',
		success: function(res) {console.log(res);}
});


