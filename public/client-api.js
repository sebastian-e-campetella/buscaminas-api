const http = require('http');

client = { 
  options: {
    host: 'localhost',
    port: 3333,
    path: '/v1/games',
    method: 'POST',
    headers: {
      accept: 'application/json'
    }
  },

  start_game: function() {
    http.request(this.options, function(res){
      var body = '';

      res.on('data', function(chunk_http){
        body += chunk_http;
      });

      res.on('end', function(){
        var data = JSON.parse(body);
        console.log(data);
      });
    }).end();
  },

  set_flag: function(id, cell_id) {
    this.options["method"] = 'PUT';
    this.options["path"] = '/v1/flag?id='+id+'&cell_id='+cell_id;
    http.request(this.options, function(res){
      var body = '';

      res.on('data', function(chunk_http){
        body += chunk_http;
      });

      res.on('end', function(){
        var data = JSON.parse(body);
        console.log(data);
      });
    }).end();
  }
}
