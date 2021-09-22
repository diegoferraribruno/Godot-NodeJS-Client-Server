var ws = new require('ws')
var server =  new ws.Server({ port: 3000 })
var temp

server.on('connection', server => {
	server.on('message', message => {
		let data = JSON.parse(message);
		console.log(data);
        temp = data.position
	});
	server.on('close',(code, reason) => {
    	console.log(code, reason);
	});
	server.send(JSON.stringify(temp));
});
