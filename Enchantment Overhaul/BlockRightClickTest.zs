import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.server.MCServer;


CTEventManager.register<MCRightClickBlockEvent>((event) => {
    var originPos = event.getBlockPos();
    var player = event.player;
    var world = player.world;
    if world.remote {
        return;
    }
    var server = world.asServerWorld().server as MCServer;
    
    if event.getItemStack().matches(<item:supplementaries:wrench>){
        if world.getBlockState(event.getBlockPos()).block == <block:minecraft:lodestone> {
            if structureCheck.infusionAltarCheck(originPos, world) {
                //event.player.sendStatusMessage("True" as MCTextComponent, true);
                
            } else if structureCheck.infusionAltarCheck(originPos, world) == false {
                server.executeCommand("execute in " + world.dimension +" run particle minecraft:angry_villager " + globals.positionCommand(originPos) + " 0.5 0.5 0.5 0 20 normal", true);
                server.executeCommand("execute positioned " +  globals.positionCommand(originPos) + " in " + world.dimension +" run playsound minecraft:entity.villager.no block @a[distance=..5]", true);
                //event.player.sendStatusMessage("False" as MCTextComponent, true);
            }
        }
        
    }
    
});