function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log('karate.env system property is:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    urlBase: '',
    myAppid: ''
  };
  if (env == 'dev') {
    config.urlBase = 'https://api.openweathermap.org/data/2.5/weather';
    config.myAppid = 'eb02692d0fc8cdbe1aa12a856563db0c';
  } else if (env == 'sit') {
  // SIT environment has different url
    config.urlBase = 'https://sit-api.openweathermap.org/data/2.5/weather';
    config.myAppid = '';
  }

  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}