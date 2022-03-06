import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.item.MCItemTossEvent;
import crafttweaker.api.util.MCHand;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.data.MapData;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.enchantment.MCEnchantment;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.util.Random;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.util.text.MCTextComponent;
import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.game.MCGame;
import crafttweaker.api.util.text.MCStyle;



CTEventManager.register<MCItemTossEvent>((event) => {
    val player = event.player;
    val world = player.world;
    val entityItem = event.entityItem as MCItemEntity;
    // First we need to see what side we are running on, we only want this to run on the server side (if `remote` is true, it means it is the client)
    if world.remote {
        // Since it is the client, we are just going to do nothing and return.
        return;
    }
    // check if item is an enchanted book
    if <item:minecraft:enchanted_book>.matches(entityItem.item) {
        // get server
        val server = world.asServerWorld().server as MCServer;
        // get item position
        val itemPos = entityItem.getPosition();
        // get nearby entities from the item position
        val nearEntities = world.getEntitiesInArea(itemPos.north(3).east(3).up(1), itemPos.south(3).west(3).down(1)) as MCEntity[];
        // create empty map
        val data = new MapData();
        // write enchantment data to map
        for ench in entityItem.item.enchantments {
            data.put(ench.registryName.toString(), entityItem.item.getEnchantmentLevel(ench));
        }
        //player.sendMessage(data.asFormattedText("", 0));
        entityItem.updateData({Motion:[0.0,-0.5,0.0]});
        entityItem.setNoGravity(true);
        EnchantData.testItems.add(new EnchantData(entityItem, 0, new MCVector3d(85.5, 6.5, 15.5)));
        
    }
});
