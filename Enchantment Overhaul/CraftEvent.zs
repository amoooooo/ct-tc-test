import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.util.text.MCTextComponent;
import stdlib.List;
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
        if world.getBlockState(event.getBlockPos()).block == <block:contenttweaker:matrix> {
            var currentRecipe = structureCheck.getItemsInPedestals(originPos, world);
            for catalyst, infusion in InfusionRecipes.infRecipes {
                // TODO: need to compare objects
                if currentRecipe.matches(infusion) {
                    println("TRUE");    
                    structureCheck.spawnItemsInArea(originPos, world);
                }
            }
        }
        
    }
    
});