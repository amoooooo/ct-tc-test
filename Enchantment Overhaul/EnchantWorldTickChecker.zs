import crafttweaker.api.event.tick.MCWorldTickEvent;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.item.IItemStack;

// Tick clock to track how far along in the animation the event is.
var clock = 0;
// Map of the world, and the enchanting item entities.
//public Map<MCWorld, MCItemEntity> itemMap = [];

CTEventManager.register<MCWorldTickEvent>((event) => {
    var server = event.world.asServerWorld().server as MCServer;
    for item in EnchantData.testItems {
        var particles = item.items.item.registryName;
        println(particles);
        if item.thrownTime <= 600 {
            item.items.updateData({Motion:[0.0,0.001,0.0]});
            item.items.updateData({PickupDelay:32767});
            item.items.setNoGravity(true);
            item.thrownTime = item.thrownTime + 1;
        } else if item.thrownTime <= 1000 && item.thrownTime > 600 {
            item.items.updateData({Motion:[0.0,0.0,0.0]});
            if item.thrownTime % 1 == 0 {
                server.executeCommand("execute in " + event.world.dimension +" run particle minecraft:item " + particles+ " " + globals.positionCommand(item.items.getPositionVec()) + " " + globals.diffVector(item.centerPos, item.items.getPositionVec(), 1.0) + " 0.2 0 normal", true);
            }
            item.thrownTime = item.thrownTime + 1;
        } else if item.thrownTime > 1000{
            item.items.setNoGravity(false);
            item.items.remove();
        }
    }
    // Animation check, resets to 0 if 5 seconds passed (20 ticks per second)
    /*
    if (clock <= 100 && enchanting == true) { 
        itemEntity.y = itemEntity.y + 0.1; 
        clock++; 
    } else { 
         clock = 0; 
        enchanting = false; 
    }*/

});