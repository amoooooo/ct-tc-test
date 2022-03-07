import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.entity.player.interact.MCRightClickBlockEvent;
import crafttweaker.api.capability.IItemHandler;
import crafttweaker.api.capability.Capabilities;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.capability.IFluidHandler;
import crafttweaker.api.capability.IFluidHandlerAction;

CTEventManager.register<MCRightClickBlockEvent>( (event) => {
    if event.player.getWorld().isRemote() { return; }

    var player = event.getPlayer();
    var world = player.world;
    var tile = world.getTileEntity(event.getBlockPos());
    var block = event.getBlockPos();

    if tile != null {
        var itemCap = tile.getCapability<IItemHandler>(Capabilities.ITEM);
        if itemCap != null {
            var item = itemCap.extractItem(0, 1, false);
            if !item.empty{
                var itemEntity = new MCItemEntity(world, block.x + 0.5, block.y + 1, block.z + 0.5, item);
                itemEntity.setNoGravity(true);
                var originParticles = new MCVector3d(84 + 0.5, 6 + 1.0, 14 + 0.5);
                world.addEntity(itemEntity);
                EnchantData.testItems.add(new EnchantData(itemEntity, 0, originParticles));
            }
                    
        }
    }

});