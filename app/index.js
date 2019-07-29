var express = require('express');
var app = express();
const version = process.env.VERSION;
const host = '0.0.0.0';
var port = process.env.PORT || 8080;
// Route:base
app.get('/', function (req, res) {
    res.status(200).json({  description:'Sample web service' });
})
// Route:version
app.get('/ping', function (req, res) {
    res.status(200).json({
        'version': version,
        'datetime': new Date(new Date().toUTCString())
    });
})
// All other routes
app.use(function(req, res) {
    // Invalid request
        res.status(404).json({
            error: { message:'Route not found' }
        });
    });

var server = app.listen(port, host, function () {
   var host = server.address().address
   var port = server.address().port
   console.log("Service listening at http://%s:%s", host, port)
})