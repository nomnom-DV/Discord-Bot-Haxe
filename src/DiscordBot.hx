package;

import flash.events.Event;		
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.Lib; 
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.net.URLRequestMethod;
import openfl.net.URLRequestHeader;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.HTTPStatusEvent;

class DiscordBot {
    static public function sendMessage(botToken:String, channelId:String, message:String)
    {
        var apiUrl = 'https://discord.com/api/v10/channels/' + channelId + '/messages';
        
    
        var jsonToSendLol = haxe.Json.stringify({
            content: message
        });
        var request = new URLRequest(apiUrl);
        request.method = URLRequestMethod.POST;

        
        var loader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, function(e:Event) {
            trace("Yo!:"+ loader.data);
        });
        loader.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent) {
            trace("error:" + e.text);
        });

        for(req in [new URLRequestHeader("Authorization", "Bot " + botToken), new URLRequestHeader("Content-Type", "application/json")])
            request.requestHeaders.push(req);
        request.data = jsonToSendLol;
        
        loader.load(request);
    }
}