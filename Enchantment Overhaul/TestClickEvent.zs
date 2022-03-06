import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.util.text.MCTextComponent;
import stdlib.List;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.world.MCWorld;

import crafttweaker.api.data.MapData;
import crafttweaker.api.server.MCServer;


CTEventManager.register<MCRightClickBlockEvent>((event) => {
    var originPos = event.getBlockPos();
    var player = event.player;
    var world = player.world;
    var ingredientMatch = 0;
    if world.remote {
        return;
    }
    var server = world.asServerWorld().server as MCServer;
    
    if event.getItemStack().matches(<item:supplementaries:wrench>){
        if world.getBlockState(event.getBlockPos()).block == <block:supplementaries:jar> || world.getBlockState(event.getBlockPos()).block == <block:supplementaries:jar_tinted> && world.getBlockState(event.getBlockPos()).hasTileEntity(){
            if !(world.getTileEntity(event.getBlockPos()).data as MapData).isEmpty {
                
            }
        }
        
    }
    
});