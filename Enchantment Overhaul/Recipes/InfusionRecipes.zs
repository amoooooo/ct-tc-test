import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.entity.MCEntity;
import math.Functions;
import stdlib.List;
import crafttweaker.api.item.IItemStack;



public class InfusionRecipes {
    public static var netherstarInfuse = new List<IItemStack>();
    public static var NetherStarRecipe = {<item:minecraft:sunflower> : netherstarInfuse } as List<IItemStack>[IItemStack];
    public static var infRecipes = new List<List<IItemStack>[IItemStack]>;


    
}

InfusionRecipes.netherstarInfuse.add(<item:minecraft:ender_pearl>);
InfusionRecipes.netherstarInfuse.add(<item:minecraft:wither_skeleton_skull>);
InfusionRecipes.infRecipes.add(InfusionRecipes.NetherStarRecipe);
