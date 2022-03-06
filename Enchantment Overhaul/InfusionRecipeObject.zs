import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.entity.MCItemEntity;
import stdlib.List;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.util.MCVector3d;


public class InfusionRecipeObject {
    public var infusion as IItemStack[List<IItemStack>] : get;

    public this(items as IItemStack[List<IItemStack>]) {
        this.infusion = items;
    }
  
}