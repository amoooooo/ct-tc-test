import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.entity.MCItemEntity;
import stdlib.List;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.util.MCVector3d;


public class EnchantData {
    public static var testItems = new List<EnchantData>();
    public var player as MCPlayerEntity : get;
    public var items as MCItemEntity : get;
    public var thrownTime as int : get;
    public var centerPos as MCVector3d : get;

    public this(player as MCPlayerEntity, items as MCItemEntity, thrownTime as int, centerPos as MCVector3d) {
        this.player = player;
        this.items = items;
        this.thrownTime = thrownTime;
        this.centerPos = centerPos as MCVector3d;
    }
  
}