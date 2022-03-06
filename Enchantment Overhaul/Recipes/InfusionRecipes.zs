import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.entity.MCEntity;
import math.Functions;
import stdlib.List;
import crafttweaker.api.item.IItemStack;



public class InfusionRecipes {

    public static var infRecipes = { 
        <item:minecraft:nether_star> : new InfusionRecipeObject([<item:minecraft:ender_pearl>, <item:minecraft:wither_skeleton_skull>] as IItemStack[], <item:minecraft:sunflower> as IItemStack, [])
        } as InfusionRecipeObject[IItemStack];

    
}
