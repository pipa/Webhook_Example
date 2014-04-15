/*
	App JS
	Developer:
		Luis Matute 		- luis.matute@me.com
	Description:
		This is the server configuration.
*/

var express = require('express'),
	http = require('http'),

	app = express();

// all environments
app.set('port', process.env.PORT || 3000);

app.post('/deploy/', function (req, res) {
 	var spawn = require('child_process').spawn,
        deploy = spawn('sh', [ './deploy.sh' ]);

    deploy.stdout.on('data', function (data) {
	  	console.log(''+data);
	});

    deploy.on('close', function (code) {
        console.log('Child process exited with code ' + code);
    });
    res.json(200, {message: 'Github Hook received!'})
});

http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});
