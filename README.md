# apex-jsonviewer
This is an experimental plug-in where I tried if react based applications can be implemented in Oracle Application Express.

<img width="959" alt="image" src="https://user-images.githubusercontent.com/100072414/211216526-1b735f5c-dfdd-466a-9bdc-3881a4124430.png">

Oracle Application Express - JSON Viewer plugin

This plug-in helps to visualize JSON data in a canvas.

Minimum requirement: Oracle Application Expresss 20.2

This plug-in uses the <a href="https://jsoncrack.com/" rel="nofollow">JSON Crack</a> application. Also give this man a huge support for this awesome initiative. :muscle:

# setup

You can check each setup in my downloadable <a href="https://github.com/baldogiRichard/plug-in-site" rel="nofollow">Sample Application: APEX Plug-ins by Richard Baldogi</a>

<b>Settings</b>

You can return the data by using a function body which returns a JSON string in the <b>Settings</b> or by specifying a data source in the <b>Source</b> attributes. Please note if you use a local/remote/rest data source then your JSON will be returned by the APEX_JSON.WRITE_CONTEXT procedure which is wrapped around a curly bracket and the data key tag: 

<pre><code>
{ 
    "data": Your source data
}
</code></pre>

<img width="110" alt="image" src="https://user-images.githubusercontent.com/100072414/211217923-6904661d-3acb-4e15-8df2-6abb4cffae45.png">

<img width="568" alt="image" src="https://user-images.githubusercontent.com/100072414/211217897-8b98b49d-dd16-4cdd-8eb4-7ccfde2ce775.png">

#

License MIT
