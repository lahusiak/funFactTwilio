
//Setting up Node.js server through express

var twilio = require('twilio'),
express = require('express');

var app = express();

//configuration tokens request

app.get('/generateToken', function(request, response){
        
        var sid = request.query.sid;
        var name = request.query.name;
        
        var capability = new twilio.Capability(
            process.env.TWILIO_ACCOUNT_SID,
            process.env.TWILIO_AUTH_TOKEN
        );
        
        if(name)
        capability.allowClientIncoming(name);
        
        if(sid)
        capability.allowClientOutgoing(sid);
        
        response.status(200).send(capability.generate()):
        
        
        });

app.listen(1337);

console.log("Visit http://localhost:1337/ to accept inbound calls!");


