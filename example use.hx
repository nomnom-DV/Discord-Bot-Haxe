package;

import DiscordBot;
import flixel.FlxState;

class ExampleThingy extends FlxState 
{
    private fortnite = ["Hi", "my", "name", "is", "nom"];
    override function create(){
        super.create();

        for(msg in fortnite) DiscordBot.sendMessage(botToken, discordChannelID, msg);
    }
}