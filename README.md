# Blocmetrics
Blocmetrics is an analytics service to track events on a separate web application. It does so by sending JSON objects using the XMLHttpRequest api. For more information on this api, refer to [this documentation](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest).

##Application Setup

You will need to have another application to track events on. This metrics analytics application will collect the events from another application and display the following:

* A pie graph to show the distribution of different events in the application
* A line graph to show the number of events per day over a period of time

##Setup steps:

1. Add the following javascript snippet to your applications assets folder.
  ```
  var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = { name: eventName };
    var request = new XMLHttpRequest();
    request.open("POST","http://localhost:3000/api/events",true);
    request.setRequestHeader('Content-Type','application/json');
    request.send(JSON.stringify(event));
  }
  ```
2. Call the report function when you would like to track an event. A simple method is to add the following jQuery snippet to the page that you would like to track:
  ```
  <script type="text/javascript">
    $(document).ready(function(){
      blocmetrics.report("Viewed_page");
    });
  </script>
  ```
3. Run Blocmetrics on port 3000.
4. Run the tracked application on a different port.
5. Add your application as a registered application. The url will be the HTTP origin of the application (ex: http://localhost:4000).
5. Trigger the report function on your tracked application.

